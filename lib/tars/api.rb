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

    def self.request(endpoint)
      post("/bot#{TARS.config.token}/#{endpoint}")
    end
    private_class_method :request
  end
end
