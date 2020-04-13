require 'robot/command/registry'

class Robot
  module Command
    class Place < Callable
      def call(position_command)
        arguments = parse_arguments position_command.command
        CommandResult.new position: Position.new(**arguments)
      end

      private

      # :reek:UncommunicativeVariableName
      def parse_arguments(command)
        x, y, direction = extract_arguments command

        x = normalize_coordinate x
        y = normalize_coordinate y
        direction = direction.strip.upcase if direction.present?

        {x: x, y: y, direction: direction}
      end

      # :reek:UtilityFunction
      def extract_arguments(command)
        command.split.drop(1).join.split(',') || []
      end

      # :reek:UtilityFunction
      def normalize_coordinate(value)
        value.to_i if value.is_a?(String) && value.match?(/^\d+$/)
      end
    end
  end
end

Robot::Command::Registry.add 'PLACE', Robot::Command::Place
