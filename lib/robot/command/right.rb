require 'robot/command/registry'
require 'robot/command/turn'

class Robot
  module Command
    class Right < Turn
      TRANSFORMATIONS = {
        'NORTH' => 'EAST',
        'EAST'  => 'SOUTH',
        'SOUTH' => 'WEST',
        'WEST'  => 'NORTH'
      }.freeze
    end
  end
end

Robot::Command::Registry.add 'RIGHT', Robot::Command::Right
