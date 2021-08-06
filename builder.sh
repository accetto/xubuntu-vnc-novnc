#!/bin/bash
### @accetto, August 2021

docker_hub_connect() {

    if [ -n "${DOCKERHUB_USERNAME}" ] && [ -n "${DOCKERHUB_PASSWORD}" ] ; then

        echo "Logging-in on Docker Hub..."
        echo "${DOCKERHUB_PASSWORD}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin
        if [ ! $? ] ; then
            echo "Docker Hub login failed"
            return 1
        fi
    else
        echo "Local pushing requires Docker Hub login."
        echo "However, your environment does not provide required authentication data."
        return 1
    fi

    return 0
}

main() {

    local repo=${1?Need repo}
    local tag=${2?Need tag}
    local cmd=${3?Need command}

    local backup_pwd
    local context
    local result

    case "${repo}" in

        base )
            context="docker/xubuntu-vnc-novnc"
            ;;

        chrome )
            context="docker/xubuntu-vnc-novnc-chrome"
            ;;

        chromium )
            context="docker/xubuntu-vnc-novnc-chromium"
            ;;

        firefox )
            context="docker/xubuntu-vnc-novnc-firefox"
            ;;

        * )
            echo "Supported 'repo' values: base, chrome, chromium, firefox"
            ;;
    esac

    backup_pwd=${PWD}

    case "${cmd}" in

        build | test )

            cd "${context}"
            hooks/"${cmd}" "${tag}"
            ;;

        push )
            
            cd "${context}"

            docker_hub_connect

            if [ $? -eq 0 ] ; then

                ### push to Docker Hub
                hooks/"${cmd}" "${tag}"

                docker logout

            else

                echo "Unable to connect to Docker hub!"
            fi
            ;;

        all )

            echo
            echo "------------------"
            echo "--> Building image"
            echo "------------------"
            echo

            cd "${context}"
            hooks/build "${tag}"

            echo
            echo "---------------------------"
            echo "--> Testing version sticker"
            echo "---------------------------"
            echo

            ### test version sticker
            result=$( hooks/test "${tag}" 2>&1 | tail -n1  )

            if [ "${result}" == '+ exit 0' ] ; then

                docker_hub_connect

                if [ $? -eq 0 ] ; then

                    echo
                    echo "-------------------------"
                    echo "--> Pushing to Docker Hub"
                    echo "-------------------------"
                    echo

                    hooks/push "${tag}"

                    docker logout

                else

                    echo "Unable to connect to Docker hub!"
                fi

            else
                echo "Version sticker has changed. Adjust 'env' hook and refresh README using 'util-refresh-readme.sh'. Use 'test' command for details."
            fi
            ;;

        *)
            echo "Unknown command: ${cmd}"
            ;;
    esac

    cd "${backup_pwd}"
}

main $@
