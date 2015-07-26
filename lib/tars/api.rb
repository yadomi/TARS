require 'json'
require 'httparty'

module TARS
  class API
    include HTTParty
    base_uri 'api.telegram.org'

    def self.me
      request 'getMe'
    end

    def self.updates
      request 'getUpdates'
    end

    def self.webhook
      # TARS.config.webhook[:scheme] = 'https'
      request 'setWebhook', url: URI::HTTPS.build(TARS.config.webhook)
    end

    def self.request(endpoint, options = {})
      p options
      post("/bot#{TARS.config.token}/#{endpoint}", query: options)
    end
    private_class_method :request
  end
end
