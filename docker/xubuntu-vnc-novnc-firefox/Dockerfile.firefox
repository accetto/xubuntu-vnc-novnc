# ./hooks/build dev
# ./hooks/build dfw
# ./hooks/build nux
# ./hooks/build nux --no-cache
# ./hooks/build dev-multiprocess
# ./hooks/build dfw-multiprocess
# ./hooks/build nux-multiprocess

ARG BASETAG=latest

FROM accetto/xubuntu-vnc-novnc:${BASETAG} as stage-firefox

### Switch to root user before install
USER 0

### 'apt-get clean' runs automatically
RUN apt-get update && apt-get install -y \
        firefox \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Preconfigure Xfce
COPY [ "./src/firefox/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/firefox/home/config/xfce4", "${HOME}/.config/xfce4/" ]
COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

FROM stage-firefox as stage-plus

ARG ARG_MOZ_FORCE_DISABLE_E10S

RUN mkdir ${HOME}/firefox.plus

COPY [ "./src/firefox.plus/resources", "${HOME}/firefox.plus" ]
COPY [ "./src/firefox.plus/resources/*.svg", "/usr/share/icons/hicolor/scalable/apps/"]
COPY [ "./src/firefox.plus/home/Desktop", "${HOME}/Desktop/" ]

### Firefox multi-process causes a lot of "Gah. Your tab just crashed."
### The only way to disable it since Firefox v68.0 is through this environment variable.
ENV MOZ_FORCE_DISABLE_E10S=${ARG_MOZ_FORCE_DISABLE_E10S:+1}

RUN \
    chmod +x ${HOME}/firefox.plus/*.sh \
    && gtk-update-icon-cache -f /usr/share/icons/hicolor

### Fix permissions
RUN \
    chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-plus as stage-final

ARG ARG_REFRESHED_AT
ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

LABEL \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    version-sticker="${ARG_VERSION_STICKER}"

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}

### Switch to default application user (non-root)
USER 1001
