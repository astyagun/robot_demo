class Robot
  module Command
    class BatchProcessor < Callable
      # :reek:UtilityFunction :reek:TooManyStatements
      # @param position [Robot::Position]
      # @param commands [<String>]
      # @return [Robot::CommandResult]
      def call(position:, commands:)
        last_position = position

        messages = commands.map do |command|
          result = Processor.call PositionCommand.new position: last_position, command: command
          last_position = result.position

          result.message
        end.compact

        CommandsResult.new position: last_position, messages: messages
      end
    end
  end
end
