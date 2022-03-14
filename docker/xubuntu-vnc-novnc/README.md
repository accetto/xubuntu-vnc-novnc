# Headless Ubuntu/Xfce container with VNC/noVNC

## accetto/xubuntu-vnc-novnc

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

**Attention!** The repository is **retired** and **archived**. It will not be developed any further and the related images on Docker Hub will not be rebuilt any more. They will phase out and they will be deleted after becoming too old. Please use the newer **third generation** (G3) repository [accetto/ubuntu-vnc-xfce-g3][accetto-ubuntu-vnc-xfce-g3] and the related images on Docker Hub instead. If you still need images based on `Ubuntu 18.04 LTS`, then feel free using the repository for building the images locally.

***

![badge-docker-pulls][badge-docker-pulls]
![badge-docker-stars][badge-docker-stars]
![badge-github-release][badge-github-release]
![badge-github-release-date][badge-github-release-date]

**Tip** If you want newer images based on [Ubuntu 20.04 LTS][docker-ubuntu] with the latest [TigerVNC][tigervnc-releases]/[noVNC][novnc-releases] versions, please check the **third generation** (G3) [accetto/ubuntu-vnc-xfce-g3][accetto-docker-ubuntu-vnc-xfce-g3], [accetto/ubuntu-vnc-xfce-chromium-g3][accetto-docker-ubuntu-vnc-xfce-chromium-g3] or [accetto/ubuntu-vnc-xfce-firefox-g3][accetto-docker-ubuntu-vnc-xfce-firefox-g3].

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment and [VNC][tigervnc]/[noVNC][novnc] servers for headless use.

The main image is a streamlined and simplified version of my other image [accetto/ubuntu-vnc-xfce][accetto-docker-ubuntu-vnc-xfce] and it is part of the growing [image hierarchy][this-wiki-image-hierarchy].

The main features and components of the images are:

- utilities **ping**, **wget**, **zip**, **unzip**, **sudo**, [curl][curl], [git][git] (Ubuntu distribution)
- utility **gdebi** lets  you install local `.deb` packages resolving and installing their dependencies (Ubuntu distribution)
- current version of JSON processor [jq][jq]
- light-weight [Xfce][xfce] desktop environment (Ubuntu distribution)
- current version of high-performance [TigerVNC][tigervnc] server and client
- current version of [noVNC][novnc] HTML5 clients (full and lite) (TCP port **6901**)
- popular text editors [vim][vim] and [nano][nano] (Ubuntu distribution)
- lite but advanced graphical editor [mousepad][mousepad] (Ubuntu distribution)
- [xfce4-screenshooter][screenshooter] and image viewer [ristretto][ristretto] (Ubuntu distribution)
- current version of [tini][tini] as the entry-point initial process (PID 1)
- support for overriding both the container user account and its group
- support of **version sticker** (see below)

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `ubuntu:latest`

    ![badge-VERSION_STICKER_LATEST][badge-VERSION_STICKER_LATEST]

- `lab` is also based on `ubuntu:latest`, but built with `ARG_SUPPORT_USER_GROUP_OVERRIDE`

    ![badge-VERSION_STICKER_LAB][badge-VERSION_STICKER_LAB]

There are also archive images that are tagged like `ubuntu18.04.3` and similar. Those are previous production images and they can be useful for testing.

Sometimes you can also spot tags like `dev`, `lab-dev` and similar. Those are temporary images under development and they should not be used.

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-novnc] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile`  
  
  This is the main *Dockerfile* for building the `latest` image tag based on the `ubuntu:latest` tag by default.  

  However, by providing the `BASETAG` build argument it is possible to build images based on other Ubuntu tags, for example `ubuntu:rolling`.  

  ```shell
  docker build --build-arg BASETAG=rolling -t accetto/xubuntu-vnc-novnc:rolling
  ```

  By providing the `ARG_SUPPORT_USER_GROUP_OVERRIDE` build argument it is possible to build the `lab` images that support overriding the container user group. Note that the value of the build argument does not really matter, anything means *true*.

  ```shell
  docker build --build-arg ARG_SUPPORT_USER_GROUP_OVERRIDE=yes -t accetto/xubuntu-vnc-novnc:lab
  ```

### Ports

Following **TCP** ports are exposed:

- **5901** used for access over **VNC**
- **6901** used for access over [noVNC][novnc]

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

### Version sticker

Version sticker serves multiple purposes that are closer described in [Wiki][this-wiki]. The **version sticker value** identifies the version of the docker image and it is persisted in it when it is built. It is also shown as a badge in the README file.

However, the script `version_sticker.sh` can be used anytime for convenient checking of the current versions of installed applications.

The script is deployed into the startup folder, which is defined by the environment variable `STARTUPDIR` with the default value of `/dockerstartup`.

If the script is executed inside a container without an argument, then it returns the **current version sticker value** of the container. This value is newly calculated and it is based on the current versions of the essential applications in the container.

The **current** version sticker value will differ from the **persisted** value, if any of the included application has been updated to another version.

If the script is called with the argument `-v` (lower case `v`), then it prints out verbose versions of the essential applications that are included in the **version sticker value**.

If it is called with the argument `-V` (upper case `v`), then it prints out verbose versions of some more applications.

Examples can be found in [Wiki][this-wiki].

## Using headless containers

There are two ways, how to use the created headless containers.

The default **VNC user** password is **headless** and it can be changed through the environment variable **VNC_PW**. For example the following container would use the password value **mynewpwd**:

```shell
docker run -dP -e VNC_PW=mynewpwd accetto/xubuntu-vnc-novnc
```

### Over VNC

To be able to use the containers over **VNC**, some **VNC Viewer** is needed (e.g. [TigerVNC][tigervnc] or [TightVNC][tightvnc]).

The VNC Viewer should connect to the host running the container, pointing to its TCP port mapped to the container's TCP port **5901**.

For example, if the container has been created on the host called `mynas` using the parameters described above, the VNC Viewer should connect to `mynas:25901`.

### Over noVNC

To be able to use the containers over [noVNC][novnc], an HTML5 capable web browser is needed. It actually means, that any current web browser can be used.

The browser should navigate to the host running the container, pointing to its TCP port mapped to the container's TCP port **6901**.

The containers offer two [noVNC][novnc] clients - the **lite** client and the **full** client with more features. The connection URL differs slightly in both cases. To make it easier, a **simple startup page** is implemented.

For example, if the container has been created on the host called `mynas` using the parameters described above, then the web browser should navigate to `http://mynas:26901`.

The startup page will show two hyperlinks pointing to the both noVNC clients:

- `http://mynas:26901/vnc_lite.html`
- `http://mynas:26901/vnc.html`

It's also possible to provide the password through the links:

- `http://mynas:26901/vnc_lite.html?password=headless`
- `http://mynas:26901/vnc.html?password=headless`

## Container user accounts

Containers created from this image run under the **default application user** (headless, 1001:0) with the default password set also to **headless**. This password can be changed inside the container using the following command:

```shell
passwd
```

Please do not confuse the **default application user** password with the **VNC user** password, because they both have the same default value. However, the former one is used for **sudo** and it can be changed using `passwd` command. The latter one is used for VNC access and it can be changed through the **VNC_PW** environment variable (see above).

The **sudo** command allows user elevation, so the **default application user** can, for example, install new applications.

The following example shows how to install **git**:

```shell
sudo apt-get update
sudo apt-get install -y git
```

Note that the default application account's **group membership** (group zero) does not give it automatically the privileges of the **root** user. Technical details will be described in [Wiki][this-wiki].

The container user ID (1001 by default) can be changed by creating the container using the `--user` parameter, for example:

```shell
docker run -itP --rm --user 2019 accetto/xubuntu-vnc-novnc
```

The image supports also overriding the container user's group ID (0 by default). However, the image must be built with the argument `ARG_SUPPORT_USER_GROUP_OVERRIDE`. Otherwise the following command line would fail:

```shell
### This will fail (Permission denied)
docker run -itP --rm --user 2019:2000 accetto/xubuntu-vnc-novnc:latest

### This will work (image built with ARG_SUPPORT_USER_GROUP_OVERRIDE)
docker run -itP --rm --user 2019:2000 accetto/xubuntu-vnc-novnc:lab
```

The image tag `lab` is build just that way.

Note that only numerical ID and GID are supported. Technical details will be described in [Wiki][this-wiki].

## Running containers in background (detached)

The following container will keep running in the background and it will listen on an automatically selected TCP port on the host computer:

```shell
docker run -dP accetto/xubuntu-vnc-novnc
```

The following container will listen on the host's TCP port **25901**:

```shell
docker run -d -p 25901:5901 accetto/xubuntu-vnc-novnc
```

The following container will create (or re-use) the local named volume **my\_Downloads** mounted as `/home/headless/Downloads`:

```shell
docker run -dP -v my_Downloads:/home/headless/Downloads accetto/xubuntu-vnc-novnc
```

or using the newer syntax with **--mount** flag:

```shell
docker run -dP --mount source=my_Downloads,target=/home/headless/Downloads accetto/xubuntu-vnc-novnc
```

## Running containers in foreground (interactively)

The image supports the following container start-up options: `--wait` (default), `--skip`, `--debug` (also `--tail-log`) and `--help`.

The following container will print out the help and then it will remove itself:

```shell
docker run --rm accetto/xubuntu-vnc-novnc --help
```

Excerpt from the output describing the options:

```shell
-w, --wait      (default) Keeps the UI and the vnc server up until SIGINT or SIGTERM are received.
                An optional command can be executed after the vnc starts up.
                example: docker run -d -P accetto/xubuntu-vnc-novnc
                example: docker run -it -P --rm accetto/xubuntu-vnc-novnc bash

-s, --skip      Skips the vnc startup and just executes the provided command.
                example: docker run -it -P --rm accetto/xubuntu-vnc-novnc --skip echo $BASH_VERSION

-d, --debug     Executes the vnc startup, prints some additional info and tails the VNC logs.
                Any parameters after '--debug' are ignored. CTRL-C stops the container.
                example: docker run -it -P --rm accetto/xubuntu-vnc-novnc --debug

-t, --tail-log  similar to '--debug' but no additional diagnostic info

-h, --help      Prints out this help.
                example: docker run --rm accetto/xubuntu-vnc-novnc
```

It should be noticed, that the `--debug` start-up option does not show the command prompt, even if the docker run arguments `-it` are provided. This is because the container is watching the incoming VNC connections and prints out the logs in real time. However, it is easy to attach to the running container from the second terminal window.

In the first terminal window on the host computer, create a new container named, for example, **foo**:

```shell
docker run --rm --name foo accetto/xubuntu-vnc-novnc --debug
```

In the second terminal window, execute the shell inside the running **foo** container:

```shell
docker exec -it foo bash
```

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc/
[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[this-issues]: https://github.com/accetto/xubuntu-vnc-novnc/issues

[this-github-xubuntu-vnc-novnc]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc-novnc/master/docker/xubuntu-vnc-novnc/xubuntu-vnc-novnc.jpg

[accetto-docker-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce/

[accetto-docker-xubuntu-vnc]: https://hub.docker.com/r/accetto/xubuntu-vnc
[accetto-xubuntu-vnc-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[accetto-ubuntu-vnc-xfce-g3]: https://github.com/accetto/ubuntu-vnc-xfce-g3

[accetto-docker-ubuntu-vnc-xfce-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-g3
[accetto-docker-ubuntu-vnc-xfce-chromium-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-chromium-g3
[accetto-docker-ubuntu-vnc-xfce-firefox-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-g3

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[git]: https://git-scm.com/
[jq]: https://stedolan.github.io/jq/
[mousepad]: https://github.com/codebrainz/mousepad
[nano]: https://www.nano-editor.org/
[novnc]: https://github.com/kanaka/noVNC
[novnc-releases]: https://github.com/novnc/noVNC/releases
[ristretto]: https://docs.xfce.org/apps/ristretto/start
[screenshooter]: https://docs.xfce.org/apps/screenshooter/start
[tigervnc]: http://tigervnc.org
[tigervnc-releases]: https://github.com/TigerVNC/tigervnc/releases
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[vim]: https://www.vim.org/
[xfce]: http://www.xfce.org

<!-- docker badges -->

[badge-docker-pulls]: https://badgen.net/docker/pulls/accetto/xubuntu-vnc-novnc?icon=docker&label=pulls

[badge-docker-stars]: https://badgen.net/docker/stars/accetto/xubuntu-vnc-novnc?icon=docker&label=stars

<!-- github badges -->

[badge-github-release]: https://badgen.net/github/release/accetto/xubuntu-vnc-novnc?icon=github&label=release

[badge-github-release-date]: https://img.shields.io/github/release-date/accetto/xubuntu-vnc-novnc?logo=github

<!-- latest tag badges -->

[badge-VERSION_STICKER_LATEST]: https://badgen.net/badge/version%20sticker/ubuntu18.04.6/blue

<!-- lab tag badges -->

[badge-VERSION_STICKER_LAB]: https://badgen.net/badge/version%20sticker/ubuntu18.04.6/blue
