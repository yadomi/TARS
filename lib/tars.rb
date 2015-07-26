require 'tars/version'
require 'tars/api'
require 'tars/bot'

module TARS
  class << self
    attr_accessor :config
  end

  class Configurator
    attr_accessor :token, :webhook, :server
  end

  def self.configure
    self.config ||= Configurator.new
    yield config
  end

  def self.bootstrap
    me = TARS::API.me
    puts me

    puts "Setting Bot webhook to #{TARS.config.webhook} ..."
    TARS::API.webhook

    puts 'Running local server..'
    TARS::Bot.new
  end
end
