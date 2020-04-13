class Robot
  class CommandResult
    attr_reader :position, :message

    def initialize(position:, message: nil)
      @position = position
      @message = message
    end
  end
end
