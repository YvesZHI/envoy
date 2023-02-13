#!/bin/bash


cmd='docker-compose'
which $cmd 2>/dev/null
if [ "$?" -ne "0" ]; then
    cmd='docker compose'
fi
$cmd run --rm --service-ports envoyv
if [ "$?" -eq "0" ]; then
    if [ "$#" -eq "0" ]; then
        $cmd run --rm --service-ports envoy
    fi
fi

