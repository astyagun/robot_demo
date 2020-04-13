class Robot
  class Cli
    class FileParser < Callable
      # :reek:UtilityFunction
      # @param commands [String]
      # @return [<String>]
      def call(commands)
        commands.to_s.lines.map(&:chomp)
      end
    end
  end
end
