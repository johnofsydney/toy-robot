# frozen_string_literal: true

# definition of class Ingestor for coding test.
class Ingestor
  attr_reader :file

  def initialize(filename)
    @file = File.expand_path(filename)
    raise "Cannot read file #{file}: Does not exist" unless File.exist?(@file)
  end

  def instructions
    import.select { |command| legitimate_command?(command) }
  end

  private

  PLACE_REGEX = /PLACE \d,\d,(NORTH)|(SOUTH)|(EAST)|(WEST)/.freeze

  def legitimate_command?(command)
    return true if command.match?(PLACE_REGEX)

    %w[MOVE LEFT RIGHT REPORT].include?(command)
  end

  def import
    File
      .read(file)
      .each_line
      .map(&:chomp)
  end
end
