# frozen_string_literal: true

class Robot

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def move
    true
  end

  def left
    true
  end

  def right
    true
  end

  def report
    [x, y]
  end
end