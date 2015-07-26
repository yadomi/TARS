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
    def initialize
      server = WEBrick::HTTPServer.new Port: TARS.config.server[:port]
      server.mount TARS.config.server[:path], TARS::PostHandler
      server.start
    end
  end

  class Bot
    class << self
      attr_accessor :cmds
    end

    def initialize
      @cmds = {}
    end

    def on(message, &block)
      @cmds[message] = block
    end

    def execute(command, message)
      return unless @cmds.key?(command)
      @cmds[command].call(message)
    end
  end
end
