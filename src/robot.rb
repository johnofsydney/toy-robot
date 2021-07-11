# frozen_string_literal: true
require 'pry'
class Robot

  attr_accessor :x, :y, :direction

  def initialize(instructions)
    @x = nil
    @y = nil
    @direction = nil

    @instructions = instructions
    commander
  end



  def commander
    while @instructions.length > 0
      instruction = @instructions.shift
      case instruction
      when /PLACE \d,\d,(NORTH)|(SOUTH)|(EAST)|(WEST)/
        place(instruction)
      when 'MOVE'
        move
      when 'LEFT'
        rotate('left')
      when 'RIGHT'
        rotate('right')
      when 'REPORT'
        report
      end
    end
  end

  def place(instruction)
    coordinates = instruction.scan(/\d/).map(&:to_i)
    return if coordinates.any?{ |n| n > 5 }

    @x, @y  = coordinates
    @direction = instruction.scan(/(NORTH|SOUTH|EAST|WEST)/).flatten.first
  end

  def move
    case @direction
    when 'NORTH'
      @y += 1 unless @y > 4
    when 'SOUTH'
      @y -= 1 unless @y < 1
    when 'EAST'
      @x += 1 unless @x > 4
    when 'WEST'
      @x -= 1 unless @x < 1
    end
  end

  def rotate(direction)
    position = DIRECTIONS.index(@direction)
    case direction
    when 'left'
      position = (position - 1) % 4
    when 'right'
      position = (position + 1) % 4
    end

    @direction = DIRECTIONS[position]
  end

  def report
    "#{x},#{y},#{direction}"
  end

  DIRECTIONS = %w[NORTH EAST SOUTH WEST]
end