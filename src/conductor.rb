# frozen_string_literal: true

require_relative 'ingestor'
require_relative 'robot'

# Conductor class to coordinate the creation of robots
class Conductor
  def self.start
    instructions = Ingestor.new('commands.txt').instructions
    Robot.new(instructions).report
  end
end

Conductor.start
