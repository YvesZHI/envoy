#!/bin/bash

if [ "$#" -eq 0 ]; then
    sudo -E ./ci/run_envoy_docker.sh './ci/do_ci.sh bazel.release.server_only'
else
    sudo -E ./ci/run_envoy_docker.sh './ci/do_ci.sh bazel.release'
fi
