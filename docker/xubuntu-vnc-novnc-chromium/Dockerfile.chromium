# ./hooks/build dev
# ./hooks/build dfw
# ./hooks/build nux
# ./hooks/build nux --no-cache

ARG BASETAG=latest

FROM accetto/xubuntu-vnc-novnc:${BASETAG} as stage-chromium

### Switch to root user before install
USER 0

### 'apt-get clean' runs automatically
RUN apt-get update && apt-get install -y \
        chromium-browser \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Chromium browser requires some presets
### Note that 'no-sandbox' flag is required, but intended for development only
RUN echo "CHROMIUM_FLAGS='--no-sandbox --disable-gpu --user-data-dir --window-size=${VNC_RESOLUTION%x*},${VNC_RESOLUTION#*x} --window-position=0,0'" > ${HOME}/.chromium-browser.init

### Preconfigure Xfce desktop
COPY [ "./src/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/home/config/xfce4", "${HOME}/.config/xfce4/" ]
COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

### Fix permissions
RUN \
    chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-chromium as stage-final

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
