require 'singleton'

class Robot
  module Command
    class Registry
      include Singleton
      extend SingleForwardable

      delegate %i[lookup add] => :instance

      def initialize
        @commands = {}
      end

      # :reek:NilCheck
      # @param command_with_arguments [String]
      # @return [#call]
      def lookup(command_with_arguments)
        command = command_with_arguments.split.first
        @commands[command&.upcase] || Unrecognized
      end

      # @param command [String]
      # @param command_class [#call]
      # @return [void]
      def add(command, command_class)
        @commands[command.upcase] = command_class
      end
    end
  end
end
