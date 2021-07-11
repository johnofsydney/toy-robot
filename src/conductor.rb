# frozen_string_literal: true
require 'pry'
require_relative 'ingestor'
require_relative 'robot'



class Conductor
  def self.start
    instructions = Ingestor.new('commands.txt').instructions
    Robot.new(instructions).report
  end
end

result = Conductor.start
p result