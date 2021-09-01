export TMPDIR=${TMPDIR:-$HOME/tmp}
mkdir -p "$TMPDIR"

support_lib=$(dirname "$(readlink -f "$BASH_SOURCE")")/../lib/support.bash

describe sourced
  it "returns true when in a file being sourced"
    file=$(mktemp) || return
    printf 'source "%s"\nsourced' "$support_lib"  >"$file"
    (source "$file")
    assert equal 0 $?
    rm "$file"
  end

  it "returns false when that file is run"
    file=$(mktemp) || return
    printf 'source "%s"\nsourced' "$support_lib" >"$file"
    chmod 775 "$file"
    "$file"
    assert unequal 0 $?
    rm "$file"
  end
end