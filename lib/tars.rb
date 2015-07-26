require "tars/version"
require "tars/api"

module TARS
  class << self
    attr_accessor :config
  end

  class Configurator
    attr_accessor :token
  end

  def self.configure
    self.config ||= Configurator.new
    yield config
  end
end
