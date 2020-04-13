require 'active_support/core_ext/object/blank'

require 'robot/callable'
require 'robot/command'
require 'robot/version'

# Value objects
require 'robot/command_result'
require 'robot/commands_result'
require 'robot/position'
require 'robot/position_command'

class Robot
  attr_reader :position

  def initialize
    @position = Position.new
  end

  # @param commands [<String>]
  def process_commands(commands)
    result = Command::BatchProcessor.call position: position, commands: commands
    @position = result.position

    result.messages
  end
end
