require 'robot'
require 'robot/cli/file_parser'

class Robot
  class Cli
    FILE_NAME_INVALID_MESSAGE = 'Please provide the name of a file with commands for your robot'.freeze

    attr_reader :file_name, :output

    def initialize(file_name:, output: STDOUT)
      @file_name = file_name
      @output    = output
    end

    # @return [void]
    def call
      if file_name_valid?
        output.puts Robot.new.process_commands(commands).join "\n"
      else
        output.puts FILE_NAME_INVALID_MESSAGE
      end
    end

    private

    def file_name_valid?
      file_name.present? && File.exist?(file_name)
    end

    def commands
      FileParser.call File.read file_name
    end
  end
end
