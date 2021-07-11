# frozen_string_literal: true
require 'pry'
require_relative 'ingestor'
require_relative 'robot'



class Conductor
  def self.start
    instructions = Ingestor.new('commands.txt').instructions
    robot = Robot.new(1,1)
    robot.report
  end
end

result = Conductor.start
p result