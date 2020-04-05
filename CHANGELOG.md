# CHANGELOG

## Project `accetto/xubuntu-vnc-novnc`

[Docker Hub][this-docker] - [Git Hub][this-github] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

### Release 20.04.1

- Updated versions:
  - Firefox **74.0.1**

### Release 20.04

- Updated versions:
  - Chromium Browser **80.0.3987.149**

### Release 20.03.1

- **xubuntu-vnc-novnc**
  - **Ubuntu** base image updated (inherited by all derived images)

### Release 20.03

- Updated versions:
  - Firefox **74.0**

### Release 20.02.3

- Updated versions:
  - Firefox **73.0.1**

### Release 20.02.2

- **Ubuntu** base image updated to version **18.04.4**

### Release 20.02.1

- **xubuntu-vnc-novnc**
  - **gdebi** utility for installing local `.deb` packages added
  - auto-starting again:
    - AT-SPI D-Bus Bus
  - desktop launcher for version sticker script (verbose) added
  - all other images inherit the above changes
- **README** updated (better explanation of default passwords)
- container screenshots updated
- Updated versions:
  - Chromium Browser **80.0.3987.87**
  - Firefox **73.0**

### Release 20.02

- Updated versions:
  - Chromium Browser **79.0.3945.130**
  - Firefox **72.0.2**

### Release 20.01.1

- **Ubuntu** base image has been updated
- Updated versions:
  - Firefox **72.0.1**

### Release 20.01

- **xubuntu-vnc-novnc**
  - auto-starting again:
    - Xfsettingsd
    - User folders update
- all other images inherit the above changes

### Release 19.12.2

- **xubuntu-vnc-novnc**
  - **TigerVNC** version **1.10.1**
    - version still incorrectly reported as **1.10.0** (see [issue #925](https://github.com/TigerVNC/tigervnc/issues/925))
  - **VNC_RESOLUTION** default value changed to **1360x768**
  - bottom desktop panel (panel 2) removed
  - **xfce4-screenshooter** added (version **1.8.2** from Ubuntu distribution)
  - image viewer **Ristretto** added (version **0.8.2** from Ubuntu distribution)
  - updated files:
    - **Dockerfile**
    - **vnc_startup.sh** and some other session related stuff
    - **version_of.sh** and **version_sticker.sh**
- all other images inherit the above changes

### Release 19.12.1

- **Ubuntu** base image has been updated
- Updated versions:
  - Chromium Browser **79.0.3945.79**

### Release 19.12

- Updated versions:
  - Firefox **71.0**

### Release 19.11.3

- All images:
  - **TigerVNC** server and client updated to version **1.10.0**

### Release 19.11.2

- Updated versions:
  - Chromium Browser **78.0.3904.108**

### Release 19.11.1

- All images:
  - simplified output of `vnc_startup.sh` script
  - bottom panel's auto-hide behavior changed from `Intelligently` to `Always`
- Updated versions
  - Chromium Browser **78.0.3904.97**

### Release 19.11

- All images:
  - **ubuntu** base image updated
- Updated versions
  - Chromium Browser **78.0.3904.70**
  - Firefox **70.0.1**

### Release 19.10.5

- All images:
  - **version_sticker.sh** script updated (`websockify` also displayed with `-V`)
- Updated versions
  - Firefox **70.0**

### Release 19.10.4

- **xubuntu-vnc-novnc**
  - **ubuntu** base image updated (inherited by all images)
  - **curl** and **git** added (inherited by all images)
  - **jq** (JSON processor) added in its latest version **1.6** (inherited by all images)
  - **version_of.sh** script handles also **jq** (inherited by all images)
  - **version_sticker.sh** reports added apps (similar update by all images)
  - `test` build hook updated (similar update by all images)
  - README file updated (similar update by all images)
- **xubuntu-vnc-novnc-chromium**
  - inherited new features from the base (see above)
- **xubuntu-vnc-novnc-firefox**
  - inherited new features from the base (see above)
  - `env` build hook updated

### Release 19.10.3

- All images:
  - README updated
    - **version sticker** described
    - new badges added
  - build hooks updated
    - command line arguments passed to `build` hook

### Release 19.10.2

- All images:
  - badges re-designed
    - previous badges removed and new status badges from `badge.net` and `shields.io` introduced
    - `commit` badge from `microbadger.com` introduced (per tag)
    - `version sticker` badge introduced (as static badge from `badge.net`)
    - remark: it can take several hours until new badges are actually shown (caused by caching)
  - build hooks updated
  - script **util-refresh-readme.sh** introduced
- Updated versions
  - Firefox **69.0.2**

### Release 19.10.1

- README updated

### Release 19.10

- **xubuntu-vnc-novnc-chromium**
  - **Chromium Browser** updated to version **77.0.3865.90**
- **xubuntu-vnc-novnc-firefox**
  - initial image with **Firefox Quantum** version **69.0.1**

### Release 19.09

- **xubuntu-vnc-novnc**
  - initial image with **Ubuntu 18.04.3 LTS**
- **xubuntu-vnc-novnc-chromium**
  - initial image with **Chromium Browser** version **76.0.3809.100**

***

[this-docker]: https://hub.docker.com/u/accetto/

[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy
