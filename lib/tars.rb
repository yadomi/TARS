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

    def initialize
      @verbose = true
      @logfile = '/var/log/tars.log'
    end
  end

  def self.configure
    self.config ||= Configurator.new
    yield config
    @bot = TARS::Bot.new
  end

  def self.bootstrap
    @logger = Logger.new(self.config.logfile)

    log "Setting webhook for Bot to #{TARS.config.webhook}"
    TARS::API.webhook

    log 'Launch TARS server'
    server = TARS::Server.new
    server.run!
  end

  def self.log(message, level = :info)
    puts message if TARS.config.verbose
    logger.send(level, message)
  end
end
