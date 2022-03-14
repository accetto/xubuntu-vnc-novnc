# CHANGELOG

## Project `accetto/xubuntu-vnc-novnc`

[Docker Hub][this-docker] - [Git Hub][this-github] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

### Final release 22.03.1

The repository is **retired** and **archived**. It will not be developed any further and the related images on Docker Hub will not be rebuilt any more. They will phase out and they will be deleted after becoming too old.

Please use the newer **third generation** (G3) repository [accetto/ubuntu-vnc-xfce-g3][accetto-ubuntu-vnc-xfce-g3] and the related images on Docker Hub instead.

If you still need images based on `Ubuntu 18.04 LTS`, then feel free using the repository for building the images locally.

- Updated versions:
  - Firefox **98.0**

### Release 22.03

- Updated versions:
  - Chrome **99.0.4844.51**
  - Chromium **99.0.4844.51**
  - Firefox **97.0.2**

### Release 22.02

- Updated versions:
  - Firefox **97.0**

### Release 22.01.2

- `Dockerfile` uses **TigerVNC** releases from **SourceForge** website

### Release 22.01.1

- Updated versions:
  - Chrome **97.0.4692.71**
  - Chromium **97.0.4692.71**

### Release 22.01

- Updated versions:
  - Firefox **96.0**

### Release 21.12.1

- Updated versions:
  - Firefox **95.0.1**

### Release 21.12

- Updated versions:
  - Firefox **95.0**

### Release 21.11

- Updated versions:
  - Chrome **95.0.4638.69**
  - Chromium **95.0.4638.69**
  - Firefox **94.0**

### Release 21.10.1

- Updated versions:
  - Chrome **95.0.4638.54**
  - Chromium **94.0.4606.81**

### Release 21.10

- Base image **ubuntu:18.04** has been updated to version **18.04.6**
  - derived images inherit this change
- Updated versions:
  - Chrome **94.0.4606.81**
  - Chromium **94.0.4606.71**
  - Firefox **93.0**

### Release 21.09.2

- Updated versions:
  - Chrome **94.0.4606.54**
  - Chromium **93.0.4577.63**

### Release 21.09.1

- utility `builder.sh` improved
- Updated versions:
  - Firefox **92.0**

### Release 21.09

- Updated versions:
  - Chrome **93.0.4577.63**
  - Firefox **91.0.2**

### Release 21.08.1

- utility `builder.sh` improved
- Updated versions:
  - Chrome **92.0.4515.159**
  - Chromium **92.0.4515.159**
  - Firefox **91.0.1**

### Release 21.08

- Docker Hub has removed auto-builds from free plans since 2021-07-26, therefore
  - **if you stay on the free plan**, then
    - you can still build the images locally and then push them to Docker Hub
      - pushing to Docker Hub is optional
      - just follow the added file `local-building-example.md`
      - you can use the helper utility `builder.sh`
  - regularity of updates of images on Docker Hub cannot be guaranteed any more
- Updated versions:
  - Chrome **92.0.4515.131**
  - Firefox **90.0.2**

### Release 21.07.1

- Updated versions:
  - Chrome **91.0.4472.164**
  - Firefox **90.0**

### Release 21.07

- Updated versions:
  - Firefox **89.0.2**

### Release 21.06.1

- Updated versions:
  - Chrome **91.0.4472.114**
  - Chromium **91.0.4472.101**
  - Firefox **89.0.1**

### Release 21.06

- Updated versions:
  - Chrome **91.0.4472.77**
  - Chromium **91.0.4472.77**
  - Firefox **89.0**

### Release 21.05

- Updated versions:
  - Chrome **90.0.4430.212**
  - Chromium **90.0.4430.93**
  - Firefox **88.0.1**

### Release 21.04.1

- TigerVNC from [Release Mirror on accetto/tigervnc][accetto-tigervnc-release-mirror] because **Bintray** is closing on 2021-05-01
- Updated versions:
  - Chrome **90.0.4430.93**
  - Firefox **88.0**

### Release 21.04

- Updated versions:
  - Chromium **90.0.4430.72**
  - Chrome **90.0.4430.85**

### Release 21.03.3

- Updated versions:
  - Chromium **89.0.4389.90**
  - Firefox **87.0**

### Release 21.03.2

- Updated versions:
  - Chromium **89.0.4389.82**
  - Chrome **89.0.4389.90**

### Release 21.03.1

- base **ubuntu:18.04** has been updated by Docker
- Updated versions:
  - Chrome **89.0.4389.72**

### Release 21.03

- Updated versions:
  - Firefox **86.0**

### Release 21.02.2

- fixes in CHANGELOG (release numbering)
- some optimizations in all Dockerfiles
- Updated versions:
  - Chrome **88.0.4324.182**

### Release 21.02.1

- Updated versions:
  - Firefox **85.0.1**

### Release 21.02

- **xubuntu-vnc-novnc-chrome** image added
  - current version **88.0.4324.150**
- Updated versions:
  - Firefox **85.0**

### Release 21.01.1

- Updated versions:
  - Firefox **84.0.2**

### Release 21.01

- Updated versions:
  - Firefox **84.0.1**

### Release 20.12.1

- README got links to the third generation (G3) of images
- Updated versions:
  - Firefox **84.0**

### Release 20.12

- Updated versions:
  - Chromium Browser **87.0.4280.66**
  
### Release 20.11

- Updated versions:
  - Chromium Browser **86.0.4240.198**
  - Firefox **83.0**

### Release 20.10.2

- Updated versions:
  - Chromium Browser **86.0.4240.75**
  - Firefox **82.0**

### Release 20.10.1

- hook scripts updated (all images)
  - automatic archiving of previous image versions removed
- **xubuntu-vnc-novnc-firefox**
  - switch **MOZ_FORCE_DISABLE_E10S=1** seems not working any more
    - build argument **ARG_MOZ_FORCE_DISABLE_E10S** removed
    - environment variable **MOZ_FORCE_DISABLE_E10S** removed
    - `singleprocess` tag removed
    - hook scripts updated accordingly

### Release 20.10

- updated scripts (all images):
  - version_of.sh
  - version_sticker.sh
  - util-hdx.sh
- Updated versions:
  - Chromium Browser **85.0.4183.121**
  - Firefox **81.0**

### Release 20.09.1

- **nano** editor added
- Updated versions:
  - Chromium Browser **85.0.4183.83**

### Release 20.09

- Firefox **80.0.1**

### Release 20.08.2

- Firefox **80.0**

### Release 20.08.1

- **xubuntu-vnc-novnc**
  - base image **ubuntu:18.04** has been updated to version **18.04.5**
    - derived images inherit this change
- Updated versions:
  - Chromium Browser **84.0.4147.105**

### Release 20.08

- **xubuntu-vnc-novnc**
  - base **ubuntu:18.04** image has been updated
    - derived images inherit this change
- Updated versions:
  - Firefox **79.0**

### Release 20.07.1

- **xubuntu-vnc-novnc**
  - base **ubuntu:18.04** image has been updated
  - **noVNC** version **1.2.0**
  - **version_of.sh** updated (because of **noVNC**)
  - all above changes inherited by all derived images
- Updated versions:
  - Firefox **78.0.2**

### Release 20.07

- **xubuntu-vnc-novnc-firefox**
  - fix in `push` hook script
- Updated versions:
  - Firefox **78.0.1**

### Release 20.06.2

- **xubuntu-vnc-novnc**
  - `version_of.sh` updated (Firefox version pattern)
    - this will be inherited by all derived images
- **xubuntu-vnc-novnc-firefox**
  - **IMPORTANT**: Firefox multi-process mode is default now and therefore larger shared memory (`/dev/shm`) is required (see bellow)
    - environment variable **MOZ_FORCE_DISABLE_E10S** is not set by default any more
    - **containers with Firefox require more shared memory** (/dev/shm) to run reliably
      - at least **256MB** is recommended (default is just 64MB)
      - use `docker run --shm-size=256m`
        - or `shm_size: 256m` at service level in docker-compose files
        - see [Firefox multi-process][that-wiki-firefox-multiprocess] in Wiki for description and instructions
    - this fixes the [issue #2 (Firefox 77.0.1 scrambles pages)](https://github.com/accetto/xubuntu-vnc-novnc/issues/2)
    - Internet browsing should be **sand-boxed** now
    - tag `multiprocess` is replaced by `singleprocess` one
      - which is single-threaded, but
      - please be aware that in **this** release (still Firefox **77.0.1**) webpages will be still scrambled (issue #2)
      - it should be fixed by Mozilla in the next Firefox release
  - all above changes are inherited by all derived images that include Firefox
- Other changes:
  - added some help comments into Dockerfiles
  - README files have been updated
- Updated versions:
  - Firefox **77.0.1**

### Release 20.06.1

- Quick mitigation of issue [#2 (Firefox 77.0.1 scrambles pages)](https://github.com/accetto/xubuntu-vnc-novnc/issues/2)
  - by rolling back **Firefox** to version **76.0.1**

### Release 20.06

- **xubuntu-vnc-novnc**
  - [Issue #1](https://github.com/accetto/xubuntu-vnc-novnc/issues/1) fixed by fixing **vnc_startup.sh**
    - fixes also startup-up options **--debug** and **--tail-log**
- Updated versions:
  - Chromium Browser **83.0.4103.61**
  - Firefox **77.0.1**

### Release 20.05

- Updated versions:
  - Chromium Browser **81.0.4044.138**
  - Firefox **76.0.1**

### Release 20.04.4

- **xubuntu-vnc-novnc**
  - using base image tag **ubuntu:18.04** explicitly
    - **env** hook script updated accordingly
    - note that the tag **latest** now means **based on ubuntu:18.04**
  - **websockify** updated to version **0.9.0**
  - all above changes inherited by all derived images

### Release 20.04.3

- **xubuntu-vnc-novnc**
  - **tini** updated to version **0.19.0** (inherited by all derived images)

### Release 20.04.2

- Updated versions:
  - Firefox **75.0**
  - Chromium Browser **80.0.3987.163**

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

[accetto-tigervnc-release-mirror]: https://github.com/accetto/tigervnc/releases

[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[that-wiki-firefox-multiprocess]: https://github.com/accetto/xubuntu-vnc/wiki/Firefox-multiprocess

[accetto-ubuntu-vnc-xfce-g3]: https://github.com/accetto/ubuntu-vnc-xfce-g3
