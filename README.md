# Headless Ubuntu/Xfce containers with VNC/noVNC

## Project `accetto/xubuntu-vnc-novnc`

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

![badge-github-release][badge-github-release]
![badge-github-release-date][badge-github-release-date]
![badge-github-stars][badge-github-stars]
![badge-github-forks][badge-github-forks]
![badge-github-open-issues][badge-github-open-issues]
![badge-github-closed-issues][badge-github-closed-issues]
![badge-github-releases][badge-github-releases]
![badge-github-commits][badge-github-commits]
![badge-github-last-commit][badge-github-last-commit]

***

- [Headless Ubuntu/Xfce containers with VNC/noVNC](#headless-ubuntuxfce-containers-with-vncnovnc)
  - [Project `accetto/xubuntu-vnc-novnc`](#project-accettoxubuntu-vnc-novnc)
    - [Introduction](#introduction)
    - [Image generations](#image-generations)
    - [Project versions](#project-versions)
    - [Description](#description)
    - [Git Hub subfolders / Docker image sets](#git-hub-subfolders--docker-image-sets)
      - [xubuntu-vnc-novnc](#xubuntu-vnc-novnc)
      - [xubuntu-vnc-novnc-chrome](#xubuntu-vnc-novnc-chrome)
      - [xubuntu-vnc-novnc-chromium](#xubuntu-vnc-novnc-chromium)
      - [xubuntu-vnc-novnc-firefox](#xubuntu-vnc-novnc-firefox)
      - [utils](#utils)
  - [Issues](#issues)
  - [Credits](#credits)

***

### Introduction

This repository contains resources for building Docker images based on [Ubuntu 18.04 LTS][docker-ubuntu] with [Xfce][xfce] desktop environment and [VNC][tigervnc]/[noVNC][novnc] servers for headless use.

### Image generations

This is the **second generation** (G2) of my headless images, that I've retired back in March 2022. However, because I've noticed that the images are still pulled, I've revived the project in November 2022. The current **second version** (G2v2) brings some improvements, mostly in the building pipeline and supporting scripts.

If you want the **newer images** based on [Ubuntu 20.04 LTS][docker-ubuntu] with the latest [TigerVNC][tigervnc-releases]/[noVNC][novnc-releases] versions, please check the **third generation** (G3) [accetto/ubuntu-vnc-xfce-g3][accetto-docker-ubuntu-vnc-xfce-g3], [accetto/ubuntu-vnc-xfce-chromium-g3][accetto-docker-ubuntu-vnc-xfce-chromium-g3] or [accetto/ubuntu-vnc-xfce-firefox-g3][accetto-docker-ubuntu-vnc-xfce-firefox-g3].

### Project versions

This file describes the **second version** (G2v2) of the project.

The **first version** (G2v1, or simply G2) has been retired back in March 2022, but I've revived it in November 2022, because I've noticed, that the images still have been pulled. It will be available in this **GitHub** repository as the archived branch `archived-generation-g2v1`.

The version `G2v2` brings the following changes comparing to the previous version `G2v1`:

- The values of the **version sticker** variables (`VERSION_STICKER_*`) in the `env` hook scripts are not hardcoded, but initialized from the related environment variables.
- The helper utility `util-refresh-readme.sh` does not update the original `README.md` files, but their clones named `scrap_readme.md`. The content of this temporary file is intended to be copy-and-pasted to the **Docker Hub**.

### Description

The resources for the individual images and their variations are stored in the folders of the [Git Hub][this-github] repository and the image features are described in the individual README files. Additional descriptions can be found in the common project [Wiki][this-wiki].

All images are part of the following [image hierarchy][this-wiki-image-hierarchy].

### Git Hub subfolders / Docker image sets

#### [xubuntu-vnc-novnc][this-github-xubuntu-vnc-novnc]

Contains resources for building [accetto/xubuntu-vnc-novnc][this-docker-xubuntu-vnc-novnc] base images.

The images are streamlined and simplified versions of my other images [accetto/ubuntu-vnc-xfce][accetto-docker-ubuntu-vnc-xfce].

Several variations are available, including the one supporting overriding both the container user and the user group.

These base images already include commonly used utilities **ping**, **wget**, **zip**, **unzip**, **sudo**, [curl][curl], [git][git] and also the current version of [jq][jq] JSON processor.

Additional components and applications can be easily added by the user because **sudo** is supported.

Check this [README][this-github-readme-xubuntu-vnc-novnc] file for more information.

#### [xubuntu-vnc-novnc-chrome][this-github-xubuntu-vnc-novnc-chrome]

Contains resources for building [accetto/xubuntu-vnc-novnc-chrome][this-docker-xubuntu-vnc-novnc-chrome] images with the [Google Chrome][chrome] web browser.

Check this [README][this-github-readme-xubuntu-vnc-novnc-chrome] file for more information.

#### [xubuntu-vnc-novnc-chromium][this-github-xubuntu-vnc-novnc-chromium]
  
Contains resources for building [accetto/xubuntu-vnc-novnc-chromium][this-docker-xubuntu-vnc-novnc-chromium] images with the open-source [Chromium][chromium] web browser.

Check this [README][this-github-readme-xubuntu-vnc-novnc-chromium] file for more information.

#### [xubuntu-vnc-novnc-firefox][this-github-xubuntu-vnc-novnc-firefox]
  
Contains resources for building [accetto/xubuntu-vnc-novnc-firefox][this-docker-xubuntu-vnc-novnc-firefox] images with the current [Firefox][firefox] web browser.

Several variations are available, including the one supporting easy pre-configuration and copying of personal Firefox user preferences.

The images are streamlined and simplified versions of my other images [accetto/ubuntu-vnc-xfce-firefox-plus][accetto-docker-ubuntu-vnc-xfce-firefox-plus] and [accetto/ubuntu-vnc-xfce-firefox-default][accetto-docker-ubuntu-vnc-xfce-firefox-default].

Check this [README][this-github-readme-xubuntu-vnc-novnc-firefox] file for more information.

#### [utils][this-github-utils]
  
Contains utilities that make building the images more convenient.

- `util-hdx.sh`  

  Displays the file head and executes the chosen line, removing the first occurrence of '#' and trimming the line from left first. Providing the line number argument skips the interaction and executes the given line directly.
  
  The comment lines at the top of included Dockerfiles are intended for this utility.

  The utility displays the help if started with the `-h` or `--help` argument. It has been developed using my other utilities `utility-argbash-init.sh` and `utility-argbash.sh`, contained in the [accetto/argbash-docker][accetto-github-argbash-docker-utils] Git Hub repository, from which the [accetto/argbash-docker][accetto-docker-argbash-docker] Docker image is built.

- `util-refresh-readme.sh`  
  
  This script can be used for updating the `version sticker` badges in README files. It is intended for local use before publishing the repository.

  The script does not include any help, because it takes only a single argument - the path where to start searching for files (default is `../docker`). However, there is the file `local-building-example.md` explaining how to use it.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/u/accetto/

[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[this-issues]: https://github.com/accetto/xubuntu-vnc-novnc/issues

[this-github-utils]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/utils/

[this-github-xubuntu-vnc-novnc]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc/
[this-docker-xubuntu-vnc-novnc]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc/

[this-github-xubuntu-vnc-novnc-chrome]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-chrome/
[this-github-xubuntu-vnc-novnc-chromium]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-chromium/
[this-docker-xubuntu-vnc-novnc-chrome]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-chrome/
[this-docker-xubuntu-vnc-novnc-chromium]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-chromium/

[this-github-xubuntu-vnc-novnc-firefox]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-firefox/
[this-docker-xubuntu-vnc-novnc-firefox]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-firefox/

[this-github-readme-xubuntu-vnc-novnc]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/docker/xubuntu-vnc-novnc/README.md
[this-github-readme-xubuntu-vnc-novnc-chrome]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/docker/xubuntu-vnc-novnc-chrome/README.md
[this-github-readme-xubuntu-vnc-novnc-chromium]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/docker/xubuntu-vnc-novnc-chromium/README.md
[this-github-readme-xubuntu-vnc-novnc-firefox]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/docker/xubuntu-vnc-novnc-firefox/README.md

[accetto-docker-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce
[accetto-docker-ubuntu-vnc-xfce-firefox-default]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-default
[accetto-docker-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus

[accetto-github-xubuntu-vnc]: https://github.com/accetto/xubuntu-vnc/
[accetto-xubuntu-vnc-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[accetto-ubuntu-vnc-xfce-g3]: https://github.com/accetto/ubuntu-vnc-xfce-g3

[accetto-docker-ubuntu-vnc-xfce-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-g3
[accetto-docker-ubuntu-vnc-xfce-chromium-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-chromium-g3
[accetto-docker-ubuntu-vnc-xfce-firefox-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-g3

[accetto-docker-argbash-docker]: https://hub.docker.com/r/accetto/argbash-docker
[accetto-github-argbash-docker-utils]: https://github.com/accetto/argbash-docker/tree/master/utils

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[chrome]: https://www.google.com/chrome/
[chromium]: https://www.chromium.org/Home
[git]: https://git-scm.com/
[inkscape]: https://inkscape.org/
[jq]: https://stedolan.github.io/jq/
[firefox]: https://www.mozilla.org
[git]: https://git-scm.com/
[novnc]: https://github.com/kanaka/noVNC
[novnc-releases]: https://github.com/novnc/noVNC/releases
[tigervnc]: http://tigervnc.org
[tigervnc-releases]: https://github.com/TigerVNC/tigervnc/releases
[xfce]: http://www.xfce.org

<!-- github badges -->

[badge-github-release]: https://badgen.net/github/release/accetto/xubuntu-vnc-novnc?icon=github&label=release

[badge-github-release-date]: https://img.shields.io/github/release-date/accetto/xubuntu-vnc-novnc?logo=github

[badge-github-stars]: https://badgen.net/github/stars/accetto/xubuntu-vnc-novnc?icon=github&label=stars

[badge-github-forks]: https://badgen.net/github/forks/accetto/xubuntu-vnc-novnc?icon=github&label=forks

[badge-github-releases]: https://badgen.net/github/releases/accetto/xubuntu-vnc-novnc?icon=github&label=releases

[badge-github-commits]: https://badgen.net/github/commits/accetto/xubuntu-vnc-novnc?icon=github&label=commits

[badge-github-last-commit]: https://badgen.net/github/last-commit/accetto/xubuntu-vnc-novnc?icon=github&label=last%20commit

[badge-github-closed-issues]: https://badgen.net/github/closed-issues/accetto/xubuntu-vnc-novnc?icon=github&label=closed%20issues

[badge-github-open-issues]: https://badgen.net/github/open-issues/accetto/xubuntu-vnc-novnc?icon=github&label=open%20issues
