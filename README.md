# Headless Ubuntu/Xfce containers with VNC/noVNC

## Project `accetto/xubuntu-vnc-novnc`

[Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

This project repository contains resources for building various Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment and [VNC][tigervnc]/[noVNC][novnc] servers for headless use.

The resources for the individual images and their variations are stored in the subfolders of the [Git Hub][this-github] repository and the image features are described in the individual README files. Additional descriptions can be found in the common project [Wiki][this-wiki].

All images are part of the growing [image hierarchy][this-wiki-image-hierarchy].

### Git Hub subfolders / Docker image sets

#### [xubuntu-vnc-novnc][this-github-xubuntu-vnc-novnc]

Contains resources for building [accetto/xubuntu-vnc-novnc][this-docker-xubuntu-vnc-novnc] base images.

The images are streamlined and simplified versions of my other images [accetto/ubuntu-vnc-xfce][accetto-docker-ubuntu-vnc-xfce].

Several variations are available, including the one supporting overriding both the container user and the user group.

Additional components and applications can be easily added by the user because **sudo** is supported.

#### [xubuntu-vnc-novnc-chromium][this-github-xubuntu-vnc-novnc-chromium]
  
Contains resources for building [accetto/xubuntu-vnc-novnc-chromium][this-docker-xubuntu-vnc-novnc-chromium] images with the open-source [Chromium][chromium] web browser.

#### [xubuntu-vnc-novnc-firefox][this-github-xubuntu-vnc-novnc-firefox]
  
Contains resources for building [accetto/xubuntu-vnc-novnc-firefox][this-docker-xubuntu-vnc-novnc-firefox] images with the current [Firefox Quantum][firefox] web browser.

Several variations are available, including the one supporting easy pre-configuration and copying of personal Firefox user preferences.

The images are streamlined and simplified versions of my other images [accetto/ubuntu-vnc-xfce-firefox-plus][accetto-docker-ubuntu-vnc-xfce-firefox-plus] and [accetto/ubuntu-vnc-xfce-firefox-default][accetto-docker-ubuntu-vnc-xfce-firefox-default].

#### [utils][this-github-utils]
  
Contains utilities that make building the images more convenient.

- `util-hdx.sh`  
  
  Displays the file head and executes the chosen line, removing the first occurrence of '#' and trimming the line from left first. Providing the line number argument skips the interaction and executes the given line directly.
  
  The comment lines at the top of included Dockerfiles are intended for this utility.

Each utility displays the help if started with the `-h` or `--help` argument.

The utilities have been developed using my other utilities `utility-argbash-init.sh` and `utility-argbash.sh`, contained in the [accetto/argbash-docker][accetto-github-argbash-docker-utils] Git Hub repository, from which the [accetto/argbash-docker][accetto-docker-argbash-docker] Docker image is built.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-github]: https://github.com/accetto/xubuntu-vnc-novnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc-novnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc-novnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[this-issues]: https://github.com/accetto/xubuntu-vnc-novnc/issues

[this-github-utils]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/utils/

[this-github-xubuntu-vnc-novnc]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc/
[this-docker-xubuntu-vnc-novnc]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc/

[this-github-xubuntu-vnc-novnc-chromium]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-chromium/
[this-docker-xubuntu-vnc-novnc-chromium]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-chromium/

[this-github-xubuntu-vnc-novnc-firefox]: https://github.com/accetto/xubuntu-vnc-novnc/tree/master/docker/xubuntu-vnc-novnc-firefox/
[this-docker-xubuntu-vnc-novnc-firefox]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc-firefox/

[accetto-docker-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce
[accetto-docker-ubuntu-vnc-xfce-firefox-default]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-default
[accetto-docker-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus

[accetto-docker-argbash-docker]: https://hub.docker.com/r/accetto/argbash-docker
[accetto-github-argbash-docker-utils]: https://github.com/accetto/argbash-docker/tree/master/utils

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[angular]: https://angular.io/
[chromium]: https://www.chromium.org/Home
[inkscape]: https://inkscape.org/
[firefox]: https://www.mozilla.org
[git]: https://git-scm.com/
[heroku-cli]: https://devcenter.heroku.com/articles/heroku-cli
[nodejs]: https://nodejs.org/en/
[novnc]: https://github.com/kanaka/noVNC
[npm]: https://www.npmjs.com/
[postgresql]: https://www.postgresql.org/
[tigervnc]: http://tigervnc.org
[typescript]: https://www.typescriptlang.org/
[vscode]: https://code.visualstudio.com/
[xfce]: http://www.xfce.org
