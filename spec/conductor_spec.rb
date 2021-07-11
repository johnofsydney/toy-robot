# frozen_string_literal: true

require 'spec_helper'
require_relative '../src/conductor'

describe Conductor do
  before do
    allow(Ingestor).to receive(:new).and_return(mock_ingestor)
    allow(Robot).to receive(:new).and_return(mock_robot)
  end

  let(:mock_ingestor) { instance_double('Ingestor', :instructions => stub_list) }
  let(:mock_robot) { instance_double('Robot', :report => stub_report) }

  let(:stub_list) do
    ['PLACE 0,0,NORTH', 'MOVE', 'REPORT']
  end

  let(:stub_report) { [1,1] }

  describe '.start' do
    subject(:start) { described_class.start }

    it 'invokes code in other classes as expected' do
      start
      expect(Ingestor).to have_received(:new)
      expect(Robot).to have_received(:new).with(stub_list)
      expect(mock_robot).to have_received(:report)
    end
  end
end