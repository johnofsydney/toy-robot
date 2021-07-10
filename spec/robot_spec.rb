# frozen_string_literal: true

require 'spec_helper'
require_relative '../src/robot'

describe Robot do
  subject(:robot) { Robot.new(x, y) }
  let(:x)  { 1 }
  let(:y)  { 1 }

  it 'is placed correctly' do
    expect(robot.x).to eq(1)
    expect(robot.y).to eq(1)
  end

  describe '#report' do
    it{ expect(robot.report).to eq([1,1])}
  end

  describe '#move' do
    it{ expect(robot.move).to eq(true)}
  end

  describe '#left' do
    it{ expect(robot.left).to eq(true)}
  end

  describe '#right' do
    it{ expect(robot.right).to eq(true)}
  end
end