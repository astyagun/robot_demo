class Robot
  class CommandsResult
    attr_reader :position, :messages

    def initialize(position:, messages: nil)
      @position = position
      @messages = messages
    end
  end
end
