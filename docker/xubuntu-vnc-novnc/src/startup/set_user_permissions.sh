#!/bin/bash
### every exit != 0 fails the script
set -e
#set -u     # do not use

[[ -n $DEBUG ]] && _verbose="-v" || _verbose=""

USER_ID=$(id -u)
echo "Current user: $USER_ID"

### Fix file permissions
for i in "$@" ; do
    echo "Fixing permissions for: $i"

    ### folder and its current content belong to the group zero for better portability (recursively)
    chgrp -R 0 "$i"

    ### group members allowed to execute current '*.sh' scripts in the folder (recursively)
    find "$i"/ -name '*.sh' -exec chmod $_verbose g+x {} +

    ### group members allowed to execute current launchers in the folder (recursively)
    find "$i"/ -name '*.desktop' -exec chmod $_verbose g+x {} +

    ### all users have write permissions to the current folder content (recursively)
    chmod -R $_verbose a+rw "$i"

    ### all users have execute permissions to all current folder directories (recursively)
    find "$i" -type d -exec chmod $_verbose a+x {} +
done
