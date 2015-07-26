module TARS
  class Update
    class << self
      attr_reader :message, :update_id
    end

    def initialize(update)
      update.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
      TARS.bot.execute(@message['text'], self)
    end
  end
end
