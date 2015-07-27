require 'tars/version'
require 'tars/api'
require 'tars/update'
require 'tars/bot'

require 'logger'

module TARS
  class << self
    attr_accessor :config, :bot, :logger
  end

  class Configurator
    attr_accessor :token, :webhook, :server, :verbose, :logfile
  end

  def self.configure
    self.config ||= Configurator.new
    yield config
    @bot = TARS::Bot.new
  end

  def self.bootstrap
    puts "Setting webhook for Bot to #{TARS.config.webhook}"
    TARS::API.webhook

    puts 'Launch TARS server'
    server = TARS::Server.new
    server.run!
  end
end
