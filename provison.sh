#!/bin/bash



source lib.sh

missing_deps=()
for prog in wget apache2 ; do
    if ! type $prog &>/dev/null ; then
        missing_deps+=( "$prog" )
    fi
done
if (( ${#missing_deps[@]} > 0 )) ; then
    die "Missing required programs: ${missing_deps[*]}
    On Debian/Ubuntu try 'sudo apt install kpartx qemu-user-static parted wget curl jq aria2'"
fi

function run_scripts {
         run-parts --exit-on-error -v --regex '[a-zA-Z.-_]*'  ./scripts.d
         retVal=$?
         if [ $retVal -ne 0 ]; then
             log error "Something went wrong please check your script"
             exit $retVal
         else
             log notice "Sucessfully configured"
         fi
}

run_scripts