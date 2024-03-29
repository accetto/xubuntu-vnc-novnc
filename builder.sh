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
    local last_line
    local test_result

    local -i exit_code=0

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
            exit_code=$?
            ;;

        push )
            
            cd "${context}"

            docker_hub_connect

            if [ $? -eq 0 ] ; then

                ### push to Docker Hub
                hooks/"${cmd}" "${tag}"
                exit_code=$?

                docker logout

            else
                echo "Unable to connect to Docker hub!"
                exit_code=1
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

            if [ $? -eq 0 ] ; then

                echo
                echo "---------------------------"
                echo "--> Testing version sticker"
                echo "---------------------------"
                echo

                ### test version sticker
                test_result=$( hooks/test "${tag}" 2>&1 | tail -n5  )

                echo "${test_result}"
                echo

                last_line=$(echo "${test_result}" | tail -n1)

                if [ "${last_line}" == '+ exit 0' ] ; then

                    docker_hub_connect

                    if [ $? -eq 0 ] ; then

                        echo
                        echo "-------------------------"
                        echo "--> Pushing to Docker Hub"
                        echo "-------------------------"
                        echo

                        hooks/push "${tag}"
                        exit_code=$?

                        docker logout

                        echo
                        echo "Refreshing README..."

                        cd ../../utils
                        ./util-refresh-readme.sh

                    else
                        echo "Unable to connect to Docker hub!"
                        exit_code=1
                    fi

                else
                    echo "Version sticker has changed. Adjust 'env' hook and refresh README using 'util-refresh-readme.sh'. Use 'test' command for details."
                    exit_code=1
                fi
            fi
            ;;

        *)
            echo "Unknown command: ${cmd}"
            exit_code=1
            ;;
    esac

    cd "${backup_pwd}"
    
    return ${exit_code}
}

main $@
