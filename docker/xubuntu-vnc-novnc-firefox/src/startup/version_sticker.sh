#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
firefox=$("${STARTUPDIR}/version_of.sh" firefox)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "Firefox $firefox"
        ;;
    -V)
        mousepad=$("${STARTUPDIR}/version_of.sh" mousepad)
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        tigervnc=$("${STARTUPDIR}/version_of.sh" tigervnc)
        novnc=$("${STARTUPDIR}/version_of.sh" novnc)
        echo "Ubuntu $ubuntu"
        echo "Mousepad $mousepad"
        echo "VIM $vim"
        echo "TigerVNC $tigervnc"
        echo "noVNC $novnc"
        echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-firefox_68.0.2
        sticker="ubuntu$ubuntu"-"firefox$firefox"
        echo "$sticker"
        ;;
esac
