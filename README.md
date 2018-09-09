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

## Methods

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b feature/my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feature/my-new-feature)
5. Create new Pull Request
