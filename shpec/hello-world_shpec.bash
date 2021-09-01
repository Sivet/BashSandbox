#set -o nounset

shopt -s expand_aliases
alias it='(_shpec_failures=0; alias setup &>/dev/null && { setup; unalias setup; alias teardown &>/dev/null && trap teardown EXIT ;}; it'
alias ti='return "$_shpec_failures"); (( _shpec_failures += $?, _shpec_examples++ ))'
#alias end_describe='end; unalias setup teardown 2>/dev/null'

#Sourcing files in bash is weird, because any relative reference is dependant on, NOT this file
#But instead, from wherever it is executed from.

#BASHSOURCE is an array, this  gets the first element, which is this current file
#readlink, is a GNU feature, alternative is realpath, is gives a full path with the filename to the file
#dirname removes the filename so we only have the path to where our file is
#Then we add the specific file we actually want to source
source "$(dirname "$(readlink -f "$BASH_SOURCE")")"/../hello-world.bash

describe hello_world
  it "echos 'hello, world!'"
    result=$(hello_world)
    assert equal "hello, world!" "$result"
  ti
end