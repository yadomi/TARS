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
      request 'setWebhook', url: URI(TARS.config.webhook)
    end

    def self.reply_to(chat_id, text)
      request 'sendMessage', chat_id: chat_id, text: text
    end

    def self.request(endpoint, options = {})
      post("/bot#{TARS.config.token}/#{endpoint}", query: options)
    end
    private_class_method :request
  end
end
