#!/usr/bin/env bash

#Sourcing relative paths
source "$(dirname "$(readlink -f "$BASH_SOURCE")")"/lib/support.bash

main() {
    hello_world
}

hello_world() {
    echo "hello, world!"
}

#If sourced return out, uses function in the lib/support.bash file
sourced && return

#If executed, run main
main "$@"
