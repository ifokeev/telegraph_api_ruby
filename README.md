# telegraph_api_ruby

A Ruby interface to [Telegra.ph API](http://telegra.ph/api).

## Installation

Add following line to your Gemfile:

```ruby
gem 'telegraph_api_ruby'
```

And then execute:

```shell
$ bundle
```

Or install it system-wide:

```shell
$ gem install telegraph_api_ruby
```

## Usage

```ruby
require 'telegraph_api_ruby'

telegraph_access_token = 'YOUR_ACCESS_TOKEN'

html = %(
  <b>Hello World</b>
)

content = TelegraphApi::DomToNode.call(html)

data = {
  access_token: telegraph_access_token,
  title: 'Test page',
  content: JSON.dump(content),
  return_content: true
}

result = TelegraphApi::Client.create_page(data)
result.url
```

See [tests](https://github.com/ifokeev/telegraph_api_ruby/blob/master/test/test_telegraph_api.rb) also.

## Methods

See [Available methods](https://github.com/ifokeev/telegraph_api_ruby/blob/master/lib/telegraph_api_ruby/client.rb#L9-L19) and [Types](https://github.com/ifokeev/telegraph_api_ruby/tree/master/lib/telegraph_api_ruby/types).

You are able to call any method described on telegra.ph/api page right forward: 

```
TelegraphApi::Client.getAccountInfo(access_token: 'TOKEN')

```

Because this gem uses [method_missing](https://ruby-doc.org/core-2.1.0/BasicObject.html#method-i-method_missing<Paste>) for unlisted in 
[Available methods](https://github.com/ifokeev/telegraph_api_ruby/blob/master/lib/telegraph_api_ruby/client.rb#L9-L19) list.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b feature/my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feature/my-new-feature)
5. Create new Pull Request
