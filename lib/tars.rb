require "tars/version"

module TARS
  class << self
    attr_accessor :setup
  end

  class Setup
    attr_accessor :token
  end

  def self.setup
    self.setup ||= Setup.new
    yield setup
  end
end
