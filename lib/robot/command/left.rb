require 'robot/command/registry'
require 'robot/command/turn'

class Robot
  module Command
    class Left < Turn
      TRANSFORMATIONS = {
        'NORTH' => 'WEST',
        'EAST'  => 'NORTH',
        'SOUTH' => 'EAST',
        'WEST'  => 'SOUTH'
      }.freeze
    end
  end
end

Robot::Command::Registry.add 'LEFT', Robot::Command::Left
