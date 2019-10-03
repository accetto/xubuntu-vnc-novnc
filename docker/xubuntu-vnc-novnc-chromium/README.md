# Headless Ubuntu/Xfce container with VNC/noVNC and Chromium

## accetto/xubuntu-vnc-novnc-chromium

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

**TIP** Unless you need [noVNC][novnc], you can also use a slimmer image [accetto/xubuntu-vnc-chromium][accetto-docker-xubuntu-vnc-chromium], which is a member of another growing family of application images ([image hierarchy][accetto-xubuntu-vnc-wiki-image-hierarchy]).

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc]/[noVNC][novnc] servers for headless use and the current [Chromium][chromium] web browser.

The images are part of the growing [image hierarchy][this-wiki-image-hierarchy] and they are based on [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc]. They inherit all the features and therefore not the whole description will be repeated here.

The `latest` image inherits among others

- utilities **ping**, **zip**, **unzip**, **sudo**
- popular text editor [vim][vim]
- lite but advanced graphical editor [mousepad][mousepad]
- [tini][tini] as the entry-point initial process (PID 1)

and adds

- [Chromium][chromium] open-source web browser

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc-novnc:latest`  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-novnc-chromium:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-novnc-chromium:latest "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-novnc-chromium:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-novnc-chromium:latest "Get your own image badge on microbadger.com")

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-novnc-chromium] repository contains the following Dockerfiles that can be used to build the images.

- `Dockerfile.chromium`  
  
  This is the main Dockerfile for building the `latest` image tag based on the `accetto/xubuntu-vnc-novnc:latest` tag by default.

  However, by providing the `BASETAG` build argument it is possible to build images based on other base tags, for example `accetto/xubuntu-vnc-novnc:lab`.

### Ports

Following **TCP** ports are exposed:

- **5901** used for access over **VNC**
- **6901** used for access over [noVNC][novnc]

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

## Using headless containers

There are two ways, how to use the created headless containers. Please refer to the base image [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc] to learn about them.

Note that the default **VNC user** password is **headless**.

### Container user accounts

Containers created from these images run under the non-root **default application user** (headless, 1001:0). However, the **sudo** command allows user elevation. For more description check the base image [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc] or [Wiki][this-wiki].

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-chromium/

[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[this-issues]: https://github.com/accetto/xubuntu-vnc-novnc/issues

[this-github-xubuntu-vnc-chromium]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-chromium

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc-novnc/master/docker/xubuntu-vnc-novnc-chromium/xubuntu-vnc-novnc-chromium.jpg

[accetto-docker-xubuntu-vnc-novnc]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc/

[accetto-docker-xubuntu-vnc-chromium]: https://hub.docker.com/r/accetto/xubuntu-vnc-chromium
[accetto-xubuntu-vnc-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[mousepad]: https://github.com/codebrainz/mousepad
[novnc]: https://github.com/kanaka/noVNC
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[vim]: https://www.vim.org/
[xfce]: http://www.xfce.org

[chromium]: https://www.chromium.org/Home
