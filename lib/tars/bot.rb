require 'webrick'

module TARS
  class PostHandler < WEBrick::HTTPServlet::AbstractServlet
    def do_POST request, response
      response.status = 200
      response['Content-Type'] = 'text/plain'
      response.body = 'Hello, World!'
    end
  end

  class Bot
    def initialize
      @server = WEBrick::HTTPServer.new Port: TARS.config.server[:port]
      @server.mount TARS.config.server[:path], TARS::PostHandler
      trap 'INT' do @server.shutdown end
      @server.start
    end
  end
end
