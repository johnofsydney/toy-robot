# frozen_string_literal: true

class Ingestor
  attr_reader :file

  def initialize(filename)
    @file = File.expand_path(filename)
    raise "Cannot read file #{file}: Does not exist" unless File.exist?(@file)

  end

  def instructions
    import.select{ |command| legitimate_command?(command)}
  end

  private

  def legitimate_command?(command)
    return true if command.match?(/PLACE/)

    %w[MOVE LEFT RIGHT REPORT].include?(command)
  end

  ALLOWED_COMMANDS = [ /PLACE/, /MOVE/, /LEFT/, /RIGHT/, /REPORT/]

  def import
    total_records = File
                      .read(file)
                      .each_line
                      .map{ |line| line.chomp }
  end
end
