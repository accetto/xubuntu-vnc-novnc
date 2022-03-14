# Headless Ubuntu/Xfce container with VNC/noVNC and Firefox

## accetto/xubuntu-vnc-novnc-firefox

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

**WARNING** about images with Firefox

Starting from the release **20.10.1**, there is no single-process Firefox image and the multi-process mode is always enabled. Be aware, that multi-process requires larger shared memory (`/dev/shm`). At least 256MB is recommended. Please check the [Firefox multi-process][that-wiki-firefox-multiprocess] page in Wiki for more information and the instructions, how to set the shared memory size in different scenarios.

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc]/[noVNC][novnc] servers for headless use and the current [Firefox Quantum][firefox] web browser.

The main image is a streamlined and simplified version of my other image [accetto/ubuntu-vnc-xfce-firefox-plus][accetto-docker-ubuntu-vnc-xfce-firefox-plus]. The applicable **plus** features have been re-implemented because **Firefox v67** handles user profiles differently.

The images are part of the growing [image hierarchy][this-wiki-image-hierarchy] and they are based on [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc]. They inherit all the features and therefore not the whole description will be repeated here.

The `latest` image inherits among others

- utilities **ping**, **wget**, **zip**, **unzip**, **sudo**, [curl][curl], [git][git] (Ubuntu distribution)
- utility **gdebi** lets  you install local `.deb` packages resolving and installing their dependencies (Ubuntu distribution)
- current version of JSON processor [jq][jq]
- popular text editors [vim][vim] and [nano][nano] (Ubuntu distribution)
- lite but advanced graphical editor [mousepad][mousepad] (Ubuntu distribution)
- [xfce4-screenshooter][screenshooter] and image viewer [ristretto][ristretto] (Ubuntu distribution)
- current version of [tini][tini] as the entry-point initial process (PID 1)

and adds

- current version of [Firefox Quantum][firefox] web browser and some additional **plus** features described below

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc-novnc:latest`, it includes the **plus** features and it is built with the build argument **ARG_MOZ_FORCE_DISABLE_E10S**, so the Firefox multiprocess is **disabled** (see below)

    ![badge-VERSION_STICKER_LATEST][badge-VERSION_STICKER_LATEST]

- `default` is similar to `latest`, but it doesn't include the **plus** features

    ![badge-VERSION_STICKER_DEFAULT][badge-VERSION_STICKER_DEFAULT]

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-novnc-firefox] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile.firefox`  
  
  This is the main Dockerfile for building the `latest` image tag based on the `accetto/xubuntu-vnc-novnc:latest` tag by default.

  However, by providing the `BASETAG` build argument it is possible to build images based on other base tags, for example `accetto/xubuntu-vnc-novnc:lab`.

  This Docker file will include also the **plus** features described below.

- `Dockerfile.firefox.default`  
  
  This Dockerfile is for building the `default` image tag, which is also based on the `accetto/xubuntu-vnc-novnc:latest`, but it does not include the **plus** features.

- `Dockerfile.firefox.myown` can be used for building images with your own Firefox preferences already built-in

### Ports

Following **TCP** ports are exposed:

- **5901** used for access over **VNC**
- **6901** used for access over [noVNC][novnc]

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

### Container user accounts

Containers created from these images run under the non-root **default application user** (headless, 1001:0). However, the **sudo** command allows user elevation. For more description check the base image [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc] or [Wiki][this-wiki].

### Version sticker

Version sticker serves multiple purposes that are closer described in [Wiki][this-wiki]. The **version sticker value** identifies the version of the docker image and it is persisted in it when it is built. It is also shown as a badge in the README file.

However, the script `version_sticker.sh` can be used anytime for convenient checking of the current versions of installed applications.

The script is deployed into the startup folder, which is defined by the environment variable `STARTUPDIR` with the default value of `/dockerstartup`.

If the script is executed inside a container without an argument, then it returns the **current version sticker value** of the container. This value is newly calculated and it is based on the current versions of the essential applications in the container.

The **current** version sticker value will differ from the **persisted** value, if any of the included application has been updated to another version.

If the script is called with the argument `-v` (lower case `v`), then it prints out verbose versions of the essential applications that are included in the **version sticker value**.

If it is called with the argument `-V` (upper case `v`), then it prints out verbose versions of some more applications.

Examples can be found in [Wiki][this-wiki].

### Using headless containers

There are two ways, how to use the created headless containers. Please refer to the base image [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc] to learn about them.

Note that the default **VNC user** password is **headless**.

## Firefox multi-process

Firefox multi-process (also known as **Electrolysis** or just **E10S**) can cause heavy crashing in Docker containers if there is not enough shared memory (**Gah. Your tab just crashed.**).

In Firefox versions till **76.0.1** it has been possible to disable multi-process by setting the environment variable **MOZ_FORCE_DISABLE_E10S**. However, in Firefox **77.0.1** it has caused ugly scrambling of almost all web pages, because they were not decompressed.

Mozilla has fixed the problem in the next release, but they warned about not supporting the switch in future. That is why I've decided, that the mainstream image tagged as `latest` will use multi-process by default, even if it requires larger shared memory. On the positive side, performance should be higher and Internet browsing should be sand-boxed.

For some time I've maintained also `singleprocess` images intended for scenarios, where increasing the shared memory size is not possible or not wanted. However, by Firefox **81.0** I've noticed, that the environment variable **MOZ_FORCE_DISABLE_E10S** has no effect any more. Since then all images run Firefox in multi-process mode.

Please check the Wiki page [Firefox multi-process][that-wiki-firefox-multiprocess] for more information and the instructions, how the shared memory size can be set in different scenarios.

### Setting shared memory size

Instability of multi-process Firefox is caused by setting the shared memory size too low. Docker assigns only **64MB** by default. Testing on my computers has shown, that using at least **256MB** completely eliminates the problem. However, it could be different on your system.

The Wiki page [Firefox multi-process][that-wiki-firefox-multiprocess] describes several ways, how to increase the shared memory size. It's really simple, if you need it for a single container started from the command line.

For example, the following container will have its shared memory size set to 256MB:

```bash
docker run -d -P --shm-size=256m accetto/xubuntu-vnc-novnc-firefox
```

You can check the current shared memory size by executing the following command inside the container:

```bash
df -h /dev/shm
```

## Firefox preferences and the plus features

Firefox browser supports pre-configuration of user preferences.

Users can enforce their personal browser preferences if they put them into the `user.js` file and then copy it into the Firefox profile folder. The provided **plus** features make it really easy.

There is the `/home/headless/firefox.plus` folder containing the `user.js` file and the helper utility `copy_firefox_user_preferences.sh`. It will copy the `user.js` file into one or more existing Firefox profiles. The utility is easy to use, because it is interactive and it will also display the help, if started with the `-h` or `--help` argument.

To make it even more convenient, there are also desktop launchers for the utility and for the **Firefox Profile Manager**.

Recommended procedure for taking advantage of the **plus** features is:

- Start the **Firefox Profile Manager** using the desktop launcher **FF Profile Manager**. Create a new Firefox profile if there is none or you want to add one more. Wait until the profile is created and then start Firefox with it. Starting Firefox is required to create the actual profile content.
  
  **Hint**: You can also check the **Work offline** check-box before creating the profile.

  The Firefox profiles are created inside the `/home/headless/.mozilla/firefox` folder by default. Note that the `.mozilla` folder is hidden.

  Close the **Profile Manager** by pushing the **Exit** button.

- Put your personal Firefox preferences into the `user.js` file which is in the `/home/headless/firefox.plus`folder. Check the Firefox documentation (e.g. [Firefox preferences][firefox-doc-preferences]) for more information about the syntax.  
  
  **Hint**: There is also another way. You can first start Firefox, configure it and then copy the content of the `prefs.js` file from the Firefox profile folder into the `user.js` file. Then you can check the content and to keep only the preferences you really want to enforce. It's not a quick task, but you have to do it only once or until you need an update.

- Start the helper utility using the desktop launcher **Copy FF Preferences**. The utility will allow you to copy the `user.js` file to any of the existing Firefox profiles.  
  
  **Hint**: You preferences will be enforced until you delete the `user.js` file from the Firefox profile folder.

It is also very easy to build customized images with pre-filled `user.js` files. The provided `Dockerfile.firefox.myown` show how to do it. The build will take just seconds.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-firefox/

[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[that-wiki-firefox-multiprocess]: https://github.com/accetto/xubuntu-vnc/wiki/Firefox-multiprocess

[this-issues]: https://github.com/accetto/xubuntu-vnc-novnc/issues

[this-github-xubuntu-vnc-novnc-firefox]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-firefox

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc-novnc/master/docker/xubuntu-vnc-novnc-firefox/xubuntu-vnc-novnc-firefox.jpg

[accetto-docker-xubuntu-vnc-novnc]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc/

[accetto-docker-xubuntu-vnc-firefox]: https://hub.docker.com/r/accetto/xubuntu-vnc-firefox
[accetto-xubuntu-vnc-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[accetto-ubuntu-vnc-xfce-g3]: https://github.com/accetto/ubuntu-vnc-xfce-g3

[accetto-docker-ubuntu-vnc-xfce-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-g3
[accetto-docker-ubuntu-vnc-xfce-chromium-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-chromium-g3
[accetto-docker-ubuntu-vnc-xfce-firefox-g3]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-g3

[accetto-docker-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus/

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[firefox-doc-preferences]: https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences

[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[firefox]: https://www.mozilla.org
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

[badge-docker-pulls]: https://badgen.net/docker/pulls/accetto/xubuntu-vnc-novnc-firefox?icon=docker&label=pulls

[badge-docker-stars]: https://badgen.net/docker/stars/accetto/xubuntu-vnc-novnc-firefox?icon=docker&label=stars

<!-- github badges -->

[badge-github-release]: https://badgen.net/github/release/accetto/xubuntu-vnc-novnc?icon=github&label=release

[badge-github-release-date]: https://img.shields.io/github/release-date/accetto/xubuntu-vnc-novnc?logo=github

<!-- latest tag badges -->

[badge-VERSION_STICKER_LATEST]: https://badgen.net/badge/version%20sticker/ubuntu18.04.6-firefox98.0/blue

<!-- default tag badges -->

[badge-VERSION_STICKER_DEFAULT]: https://badgen.net/badge/version%20sticker/ubuntu18.04.6-firefox98.0/blue
