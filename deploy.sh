#!/bin/bash -eux

msg="Commit in $(date)"

if [ -n "$*" ]; then
    msg="$*"
fi

git add .
git commit -m "${msg}"
git push -u origin master
