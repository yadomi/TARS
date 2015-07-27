require 'webrick'
require 'tars/update'

module TARS
  class PostHandler < WEBrick::HTTPServlet::AbstractServlet
    def do_POST(request, response)
      parsed = parse(request.body)
      TARS::Update.new(parsed)
      response.status = 200
    end

    def parse(update)
      JSON.parse(update)
    end
  end

  class Server

    class << self
      attr_reader :server
    end

    def initialize
      @server = WEBrick::HTTPServer.new TARS.config.server
      @server.mount TARS.config.server['Path'], TARS::PostHandler
    end

    def run!
      @server.start
    end
  end

  class Bot
    class << self
      attr_accessor :cmds
    end

    def initialize
      @cmds = {}
    end

    def on(command, &block)
      @cmds[command] = block
    end

    def execute(command, update)
      return unless @cmds.key?(command)
      message = update.instance_variable_get('@message')
      @cmds[command].call(message, message['chat']['id'])
    end
  end
end
