require 'robot/command/registry'

class Robot
  module Command
    class Unrecognized < Callable
      def call(position_command)
        CommandResult.new \
          position: Position.new,
          message:  %(Command "#{position_command.command}" was not recognized)
      end
    end
  end
end
