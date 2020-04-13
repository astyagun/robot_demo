require 'forwardable'

class Robot
  class Callable
    extend SingleForwardable
    delegate call: :new
  end
end
