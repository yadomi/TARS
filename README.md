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
## API

`TARS.configure`:
This configuration block allow you to specify your bot settings. Options are:

- `token`: This is your bot token, keep it private. To obtain your bot token you should talk to the @botFather and register your bot.

- `webhook`: The URL that telegram will use to send you update each time your bot receive a message. This URL should point to this bot server where you run TARS. It's should be in HTTPS with a valid SSL certificate. See *How to run TARS behind Nginx* below for more information about configuring SSL.

- `server.port`: The port of the local TARS server. This can be anything if you don't want to use TARS behind a reverse proxy. However it should be a valid port handled by Telegram Bot API (Currently 80, 443, 8443)

- `server.path`: The prefix of the URL to access TARS server. This could be anything

*Note:* The server Hash can contain any WEBrick params so you can set SSL directly with TARS. See *How to run TARS with WEBrick and SSL* for more informations.

## Todo

- [x] Create a check list 
- [ ] Write documentation 
- [ ] Add unit and fonctionnal test
- [ ] Add option to deamonize/fork in backgrounds 
- [ ] Handle telegram API errors 
- [ ] Allow to pass a RegEx to `on` as first parameter
- [ ] Implement a Logger 
- [ ] Clean WEBrick output to stdout 
- [ ] Colored output 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/TARS/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
