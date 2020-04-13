require 'robot/command/registry'

class Robot
  module Command
    class Move < Callable
      MOVEMENTS = {
        x: {
          'EAST' => 1,
          'WEST' => -1
        },
        y: {
          'NORTH' => 1,
          'SOUTH' => -1
        }
      }.freeze

      def call(position_command)
        CommandResult.new position: new_position(position_command.position)
      end

      private

      def new_position(position)
        Position.new \
          x:         move(:x, position),
          y:         move(:y, position),
          direction: position.direction
      end

      def move(coordinate, position)
        value    = position.public_send coordinate
        movement = MOVEMENTS[coordinate][normalized_direction position]

        value += movement if valid?(value) && movement

        value
      end

      # :reek:UtilityFunction
      def valid?(value)
        value.is_a? Integer
      end

      # :reek:UtilityFunction
      def normalized_direction(position)
        position.direction.to_s.upcase
      end
    end
  end
end

Robot::Command::Registry.add 'MOVE', Robot::Command::Move
