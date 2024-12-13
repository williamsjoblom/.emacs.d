#!/usr/bin/env sh
printf -v ARGS "%q " "$@"
exec ssh work notmuch ${ARGS}
