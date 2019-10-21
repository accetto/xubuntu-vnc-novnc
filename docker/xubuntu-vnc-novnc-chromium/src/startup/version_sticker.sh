#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
chromium=$("${STARTUPDIR}/version_of.sh" chromium)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "Chromium $chromium"
        ;;
    -V)
        mousepad=$("${STARTUPDIR}/version_of.sh" mousepad)
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        tigervnc=$("${STARTUPDIR}/version_of.sh" tigervnc)
        novnc=$("${STARTUPDIR}/version_of.sh" novnc)
        curl=$("${STARTUPDIR}/version_of.sh" curl)
        git=$("${STARTUPDIR}/version_of.sh" git)
        jq=$("${STARTUPDIR}/version_of.sh" jq)
        echo "Ubuntu $ubuntu"
        echo "Mousepad $mousepad"
        echo "VIM $vim"
        echo "TigerVNC $tigervnc"
        echo "noVNC $novnc"
        echo "curl $curl"
        echo "Git $git"
        echo "jq $jq"
        echo "Chromium $chromium"
        ;;
    *)
        ### example: ubuntu18.04.3-chromium76.0.3809.100
        sticker="ubuntu$ubuntu"-"chromium$chromium"
        echo "$sticker"
        ;;
esac
