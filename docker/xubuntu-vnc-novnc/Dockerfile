# ./hooks/build latest
# ./hooks/test latest

### Example: Build and test 'dev' tag locally like
### ./hooks/build dev
### ./hooks/test dev
### or with additional arguments
### ./hooks/build dev --no-cache
### ./hooks/test dev
### or using the utility
### ./utils/util-hdx.sh Dockerfile 1
### ./utils/util-hdx.sh Dockerfile 2
### The last output line should be '+ exit 0'
### If '+ exit 1' then adjust the version sticker
### variables in script './hooks/env'

ARG BASETAG=18.04

FROM ubuntu:${BASETAG} as stage-ubuntu

ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

LABEL \
    maintainer="https://github.com/accetto" \
    vendor="accetto" \
    version-sticker="${ARG_VERSION_STICKER}" \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/accetto/xubuntu-vnc-novnc"

### 'apt-get clean' runs automatically
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        inetutils-ping \
        lsb-release \
        net-tools \
        sudo \
        unzip \
        vim \
        zip \
        curl \
        gdebi-core \
        git \
        wget \
        nano \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### install current 'jq' explicitly
RUN \
{ \
    JQ_VERSION="1.6" ; \
    JQ_DISTRO="jq-linux64" ; \
    cd /tmp ; \
    wget -q "https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/${JQ_DISTRO}" ; \
    wget -q "https://raw.githubusercontent.com/stedolan/jq/master/sig/v${JQ_VERSION}/sha256sum.txt" ; \
    test=$(grep "${JQ_DISTRO}" sha256sum.txt | sha256sum -c | grep -c "${JQ_DISTRO}: OK") ; \
    if [[ $test -ne 1 ]] ; then \
        echo "FAILURE: ${JQ_DISTRO} failed checksum test" ; \
        exit 1 ; \
    else \
        rm sha256sum.txt ; \
        chown root "${JQ_DISTRO}" ; \
        chmod +x "${JQ_DISTRO}" ; \
        # mv -f "${JQ_DISTRO}" $(which jq) ; \
        mv -f "${JQ_DISTRO}" /usr/bin/jq ; \
    fi ; \
    cd - ; \
}    

### next ENTRYPOINT command supports development and should be overriden or disabled
### it allows running detached containers created from intermediate images, for example:
### docker build --target stage-vnc -t dev/ubuntu-vnc-xfce:stage-vnc .
### docker run -d --name test-stage-vnc dev/ubuntu-vnc-xfce:stage-vnc
### docker exec -it test-stage-vnc bash
# ENTRYPOINT ["tail", "-f", "/dev/null"]

FROM stage-ubuntu as stage-xfce

ENV \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

### 'apt-get clean' runs automatically
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        locales \
        supervisor \
        xfce4 \
        xfce4-terminal \
        xfce4-screenshooter \
        mousepad \
        ristretto \
    && locale-gen en_US.UTF-8 \
    && apt-get purge -y \
        pm-utils \
        xscreensaver* \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

FROM stage-xfce as stage-vnc

### Bintray has been deprecated and disabled since 2021-05-01
# RUN wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.10.1.x86_64.tar.gz | tar xz --strip 1 -C /
# RUN wget -qO- https://github.com/accetto/tigervnc/releases/download/v1.10.1-mirror/tigervnc-1.10.1.x86_64.tar.gz | tar xz --strip 1 -C /
RUN wget -qO- https://sourceforge.net/projects/tigervnc/files/stable/1.10.1/tigervnc-1.10.1.x86_64.tar.gz | tar xz --strip 1 -C /

FROM stage-vnc as stage-novnc

### same parent path as VNC
ENV NO_VNC_HOME=/usr/share/usr/local/share/noVNCdim

### 'apt-get clean' runs automatically
### 'python-numpy' used for websockify/novnc
### ## Use the older version of websockify to prevent hanging connections on offline containers, 
### see https://github.com/ConSol/docker-headless-vnc-container/issues/50
### installed into '/usr/share/usr/local/share/noVNCdim'
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python-numpy \
    && mkdir -p ${NO_VNC_HOME}/utils/websockify \
    && wget -qO- https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz | tar xz --strip 1 -C ${NO_VNC_HOME} \
    && wget -qO- https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar xz --strip 1 -C ${NO_VNC_HOME}/utils/websockify \
    && chmod +x -v ${NO_VNC_HOME}/utils/*.sh \
    && rm -rf /var/lib/apt/lists/*

### add 'index.html' for choosing noVNC client
RUN echo \
"<!DOCTYPE html>\n" \
"<html>\n" \
"    <head>\n" \
"        <title>noVNC</title>\n" \
"        <meta charset=\"utf-8\"/>\n" \
"    </head>\n" \
"    <body>\n" \
"        <p><a href=\"vnc_lite.html\">noVNC Lite Client</a></p>\n" \
"        <p><a href=\"vnc.html\">noVNC Full Client</a></p>\n" \
"    </body>\n" \
"</html>" \
> ${NO_VNC_HOME}/index.html

FROM stage-novnc as stage-tini

ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /tini
RUN chmod +x /tini

FROM stage-tini as stage-final

LABEL \
    any.accetto.description="Headless Ubuntu/VNC/noVNC container with Xfce desktop" \
    any.accetto.display-name="Headless Ubuntu/VNC/noVNC container with Xfce desktop" \
    any.accetto.expose-services="6901:http,5901:xvnc" \
    any.accetto.tags="ubuntu, xfce, vnc, novnc"

### Arguments can be provided during build
ARG ARG_HOME
ARG ARG_VNC_BLACKLIST_THRESHOLD
ARG ARG_VNC_BLACKLIST_TIMEOUT
ARG ARG_VNC_PW
ARG ARG_VNC_RESOLUTION
ARG ARG_SUPPORT_USER_GROUP_OVERRIDE

ENV \
    DISPLAY=:1 \
    HOME=${ARG_HOME:-/home/headless} \
    STARTUPDIR=/dockerstartup \
    VNC_BLACKLIST_THRESHOLD=${ARG_VNC_BLACKLIST_THRESHOLD:-20} \
    VNC_BLACKLIST_TIMEOUT=${ARG_VNC_BLACKLIST_TIMEOUT:-0} \
    VNC_COL_DEPTH=24 \
    VNC_PORT="5901" \
    NO_VNC_PORT="6901" \
    VNC_PW=${ARG_VNC_PW:-headless} \
    VNC_RESOLUTION=${ARG_VNC_RESOLUTION:-1360x768} \
    VNC_VIEW_ONLY=false \
    SUPPORT_USER_GROUP_OVERRIDE=${ARG_SUPPORT_USER_GROUP_OVERRIDE}

### Creates home folder
WORKDIR ${HOME}
SHELL ["/bin/bash", "-c"]

COPY [ "./src/startup", "${STARTUPDIR}/" ]

### Preconfigure Xfce
COPY [ "./src/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/home/config/xfce4", "${HOME}/.config/xfce4/" ]
COPY [ "./src/home/config/autostart", "${HOME}/.config/autostart/" ]

### Create the default application user (non-root, but member of the group zero)
### and make '/etc/passwd' and '/etc/group' writable for the group.
### Providing the build argument ARG_SUPPORT_USER_GROUP_OVERRIDE (set to anything) makes both files
### writable for all users, adding support for user group override (like 'run --user x:y').
RUN \
    chmod 664 /etc/passwd /etc/group \
    && echo "headless:x:1001:0:Default:${HOME}:/bin/bash" >> /etc/passwd \
    && adduser headless sudo \
    && echo "headless:$VNC_PW" | chpasswd \
    && chmod +x \
        "${STARTUPDIR}/set_user_permissions.sh" \
        "${STARTUPDIR}/generate_container_user.sh" \
        "${STARTUPDIR}/vnc_startup.sh" \
        "${STARTUPDIR}/version_of.sh" \
        "${STARTUPDIR}/version_sticker.sh" \
    && ${ARG_SUPPORT_USER_GROUP_OVERRIDE/*/chmod a+w /etc/passwd /etc/group} \
    && gtk-update-icon-cache -f /usr/share/icons/hicolor

### Fix permissions
RUN "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

EXPOSE ${VNC_PORT} ${NO_VNC_PORT}

### Switch to default application user (non-root)
USER 1001

ARG ARG_REFRESHED_AT
ARG ARG_VERSION_STICKER

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}

ENTRYPOINT [ "/tini", "--", "/dockerstartup/vnc_startup.sh" ]
### tini argument '-w' means 'print a warning when processes are getting reaped'
# ENTRYPOINT [ "/tini", "-w", "--", "/dockerstartup/vnc_startup.sh" ]
### verbose argument '-v' can be repeated up to three times
### level 3 (TRACE) outputs 'No child to reap' every second
### level 2 (DEBUG) outputs also SIGCHLD signals
### level 1 (INFO) doesn't output SIGCHLD signals
# ENTRYPOINT ["/tini", "-w", "-v", "--", "/dockerstartup/vnc_startup.sh"]

### command can be provided also by 'docker run'
# CMD [ "--debug" ]
CMD [ "--wait" ]
