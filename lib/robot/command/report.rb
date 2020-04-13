require 'robot/command/registry'

class Robot
  module Command
    class Report < Callable
      # :reek:UtilityFunction
      def call(position_command)
        position = position_command.position

        message = [position.x, position.y, position.direction].join ','

        CommandResult.new position: position, message: message
      end
    end
  end
end

Robot::Command::Registry.add 'REPORT', Robot::Command::Report
