source "$(dirname "$(readlink -f "$BASH_SOURCE")")"/../hello_world

describe hello_world
  it "says 'hello, world!'"
    result=$(hello_world)
    assert equal "hello, world!" "$result"
  end
end