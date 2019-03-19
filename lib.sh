#!/bin/bash
# Constants
# shellcheck disable=SC2034
NL="$(echo)"

function die {
    echo 1>&2 ERROR: "$*"
    exit 1
}

function _op {
    "$@" &> >(sed -e 's/^/| /')
}

function _chroot {
    chroot mnt/img_root "$@"
}

function _apt {
    _op _chroot apt-get -o Acquire::ForceIPv4=true -qq "$@"
}


# Log a string via the syslog facility.
log()
{
   if [ "$1" == "notice" ]; then
#      logger -p user.$1 -t " $(date "+%F %T")=> $2"
      echo -e " $(date "+%F %T") => \e[32m$2\e[0m"
   else 
      echo -e " $(date "+%F %T") => \e[91m$2\e[0m"
   fi
}

