class Robot
  module Command
    class Turn < Callable
      # :reek:FeatureEnvy
      def call(position_command)
        position  = position_command.position
        direction = position.direction

        new_position = Position.new \
          x:         position.x,
          y:         position.y,
          direction: self.class::TRANSFORMATIONS[direction.to_s.upcase] || direction

        CommandResult.new position: new_position
      end
    end
  end
end
