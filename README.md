# TARS - Telegram BOT API

TARS is a wrapper of Telegram Bot API with WebHook support using WEBrick as HTTP server.

This is under heavy developpement, more coming soon

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tars'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tars

## Usage

```ruby
require 'tars'

TARS.configure do |config|
  config.token = '<YOUR_TOKEN>'
  config.webhook = 'https://protosify.fr/tars'
  config.server = {
    port: 8443,
    path: '/tars'
  }
end

TARS.bot.on 'Hello' do |update|
  message = update.instance_variable_get('@message')
  puts message['chat']['id']
  from = message['from']['first_name']
  TARS::API.reply_to(message['chat']['id'], "Whoop whoop whoop #{from}")
end

TARS.bootstrap
```
## Checklist 

- [x] Create a check list 
- [] Write documentation 
- [] Add option to deamonize/fork in backgrounds 
- [] Handle telegram API errors 
- [] Allow to pass a RegEx to `on` as first parameter
- [] Implement a Logger 
- [] Clean WEBrick output to stdout 
- [] Colored output 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/TARS/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
