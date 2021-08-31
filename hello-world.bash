#!/usr/bin/env bash

main() {
    hello_world
}

hello_world() {
    echo "hello, world!"
}

#If sourced return out
[[ $FUNCNAME == source ]] && return

#If executed, run main
main "$@"
