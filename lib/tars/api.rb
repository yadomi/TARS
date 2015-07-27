require 'json'
require 'httparty'
require 'rest-client'
require 'pp'
require 'open-uri'

BASE_URI = 'api.telegram.org'

module TARS
  class API
    include HTTParty
    base_uri BASE_URI

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

    def self.reply_with_photo(chat_id, photo)
      uri = "https://#{BASE_URI}/bot#{TARS.config.token}/sendPhoto"
      random = "/tmp/#{Digest::MD5.hexdigest(photo)}#{File.extname(photo)}"

      IO.copy_stream(open(photo), random)
      RestClient.post(uri, chat_id: chat_id, photo: open(random))
      File.delete(random)
    end

    def self.request(endpoint, options = {})
      post("/bot#{TARS.config.token}/#{endpoint}", query: options)
    end
    private_class_method :request
  end
end
