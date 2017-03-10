# Debugtrace

debugtrace add arguments information to backtrace.

C level method, Proc not support.

## Installation

```
$ gem install debugtrace
```

## Usage

Just require "debugtrace"

```ruby
require 'debugtrace'

def dfs(value)
  1 / value
  dfs(value-1)
end

dfs(3)
```

output

```
dfs.rb:4:in `/' : divided by 0 (ZeroDivisionError)
        from dfs.rb:4:in `dfs' {:arguments=>{:value=>0}}
        from dfs.rb:5:in `dfs' {:arguments=>{:value=>1}}
        from dfs.rb:5:in `dfs' {:arguments=>{:value=>2}}
        from dfs.rb:5:in `dfs' {:arguments=>{:value=>3}}
        from dfs.rb:8:in `<main>'
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/debugtrace. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

