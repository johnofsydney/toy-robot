# frozen_string_literal: true

require 'spec_helper'
require_relative '../src/ingestor'

describe Ingestor do
  let(:ingestor) { described_class.new(command_file) }
  let(:command_file) { File.expand_path(File.dirname(__dir__) + "/spec/fixtures/#{filename}") }
  let(:filename) { 'commands.txt' }

  describe '#instructions' do
    subject(:import) { ingestor.instructions }
    let(:expected_command_list) { ['PLACE 0,0,NORTH', 'MOVE', 'REPORT'] }

    it 'imports the contents of the file into an array' do
      expect(import).to eq(expected_command_list)
    end

    context 'when there are known and unknown commands' do
      let(:filename) { 'extra_commands.txt' }

      it { expect(import).to eq(expected_command_list) }
    end

    context 'when there are no commands' do
      let(:filename) { 'empty.txt' }

      it { expect(import).to eq([]) }
    end

    context 'when the file does not exist' do
      let(:filename) { 'no_such_file' }

      it { expect { import }.to raise_exception }
    end
  end

  describe '#legitimate_command' do
    # although this is a private method, this is the best place to test the regex
    subject(:legitimate_command?) { ingestor.send(:legitimate_command?, command) }
    let(:command) { 'PLACE 0,0,NORTH' }

    it { expect(legitimate_command?).to be true }

    context 'when place is mispelled' do
      let(:command) { 'SPACE 0,0,NORTH' }

      it { expect(legitimate_command?).to be false }
    end

    context 'when the direction is mispelled' do
      let(:command) { 'PLACE 0,0,NORFF' }

      it { expect(legitimate_command?).to be false }
    end
  end
end
