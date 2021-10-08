#!/bin/bash

case "$1" in
	h | --help)
        echo "Usage: k8s-pod-checker APP_NAME VERSION"
        exit 0
        ;;
esac
    
set -eu

readonly SLEEP=10
readonly TRIES=20
APP=$1
VERSION=$2
KUBECONFIG=$3
COUNT=1
K8SCOMMAND="kubectl --kubeconfig=${KUBECONFIG} get pods -L app,git_version -l app=${APP},version=${VERSION} --no-headers"

echo "checking running ${APP}:${VERSION}"

while [ $COUNT -le $TRIES ];
do
    sleep ${SLEEP}s
    echo "Attempting ${COUNT} try..."
    result=`$K8SCOMMAND`
    echo "$result"
    if [[ -z "$result" ]]; then
        echo "can not find target ${APP}:${VERSION}"
        exit 1
    fi
    target_pods=$(echo "$result" | wc -l)
    running_pods=$(echo "$result" | grep Running | wc -l)
    if (( target_pods == running_pods )); then
        echo "found ${running_pods} ${APP}:${VERSION} running"
        exit 0
    fi
    COUNT=`expr $COUNT + 1`
done

echo "Max attempt(${COUNT}) exceed! ${APP}:${VERSION} is not running"
exit 1
