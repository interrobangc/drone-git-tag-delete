#!/usr/bin/env bash

git ls-remote --tags origin | grep -E "refs/tags/${PLUGIN_TAG}$"

if [ "$?" = "0" ]; then
    echo "found tag ${PLUGIN_TAG} deleting..."
    git push --delete origin ${PLUGIN_TAG}
    exit $?
else
    echo "tag ${PLUGIN_TAG} not found at $DRONE_GIT_SSH_URL"
    if [ -n "${PLUGIN_FAIL_ON_MISSING}" ]; then
        exit 1
    fi
fi
