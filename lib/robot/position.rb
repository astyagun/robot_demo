class Robot
  class Position
    TABLE_SIZE = 4 # Zero based
    DIRECTIONS = Robot::Command::Left::TRANSFORMATIONS.keys

    attr_reader :x, :y, :direction

    def initialize(x: nil, y: nil, direction: nil)
      @x = x
      @y = y
      @direction = direction
    end

    def valid?
      valid_coordinate?(x) && valid_coordinate?(y) && DIRECTIONS.include?(direction)
    end

    private

    # :reek:UtilityFunction
    def valid_coordinate?(value)
      value.present? && value.is_a?(Integer) && (0..TABLE_SIZE).cover?(value)
    end
  end
end
