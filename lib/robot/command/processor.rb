require 'robot/command/registry'

class Robot
  module Command
    class Processor < Callable
      def call(position_command)
        command_class = Registry.lookup position_command.command
        command_result = command_class.call position_command

        if command_result.position.valid?
          command_result
        else
          original_position_command_result position_command, command_result
        end
      end

      private

      # :reek:UtilityFunction
      def original_position_command_result(position_command, command_result)
        CommandResult.new \
          position: position_command.position,
          message:  command_result.message
      end
    end
  end
end
