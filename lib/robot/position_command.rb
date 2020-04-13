class Robot
  class PositionCommand
    attr_reader :position, :command

    def initialize(position:, command:)
      @position = position
      @command = command
    end
  end
end
