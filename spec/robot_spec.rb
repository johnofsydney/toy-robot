# frozen_string_literal: true

require 'pry'
require 'spec_helper'
require_relative '../src/robot'

describe Robot do
  subject(:robot) { Robot.new(instructions) }
  let(:instructions) { [] }

  describe '#commander' do
    before do
      # knowlingly testing a private method
      robot.send(:commander)
    end

    context 'simple & legitimate list' do
      let(:instructions) { ['PLACE 0,0,NORTH', 'MOVE', 'REPORT'] }

      it { expect(robot.report).to eq('0,1,NORTH') }
    end

    context 'longer & legitimate list' do
      let(:instructions) do
        [
          'PLACE 4,4,NORTH',
          'MOVE',
          'MOVE',
          'RIGHT',
          'MOVE',
          'MOVE',
          'REPORT'
        ]
      end

      it { expect(robot.report).to eq('5,5,EAST') }
    end

    context 'longer & legitimate list with several place & report statement' do
      let(:instructions) do
        [
          'PLACE 4,4,NORTH',
          'MOVE',
          'MOVE',
          'RIGHT',
          'MOVE',
          'MOVE',
          'REPORT',
          'PLACE 0,0,SOUTH',
          'MOVE',
          'REPORT'
        ]
      end

      it { expect(robot.report).to eq('0,0,SOUTH') }
    end

    context 'when there is a mix of legitimate and illegitimate commands' do
      let(:instructions) do
        [
          'PLACE 4,4,NORTH',
          'MOVE',
          'MOVE',
          'RIGHT',
          'MOVE',
          'MOVE',
          'RETORT',
          'PLACE 0,0,MOUTH',
          'MOUSE',
          'REPORT'
        ]
      end

      it { expect(robot.report).to eq('5,5,EAST') }
    end
  end

  describe '#place' do
    let(:instruction) { "#{place} #{coordinates},#{direction}" }
    let(:place) { 'PLACE' }
    let(:coordinates) { '0,0' }
    let(:direction) { 'NORTH' }

    before do
      # knowingly testing a private method
      robot.send(:place, instruction)
    end

    it 'is placed correctly' do
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      expect(robot.direction).to eq(direction)
    end

    context 'with different coordinates' do
      let(:coordinates) { '2,3' }

      it 'is placed correctly' do
        expect(robot.x).to eq(2)
        expect(robot.y).to eq(3)
      end
    end

    context 'when direction is SOUTH' do
      let(:direction) { 'NORTH' }

      it { expect(robot.direction).to eq(direction) }
    end

    context 'when direction is EAST' do
      let(:direction) { 'NORTH' }

      it { expect(robot.direction).to eq(direction) }
    end

    context 'when direction is WEST' do
      let(:direction) { 'NORTH' }

      it { expect(robot.direction).to eq(direction) }
    end

    context 'when the coordinates are off the board' do
      let(:coordinates) { '7,8' }

      it 'does not change the location of the robot' do
        robot.x = 1
        robot.y = 2
        robot.send(:place, instruction)

        expect(robot.x).to be 1
        expect(robot.y).to be 2
      end
    end
  end

  describe '#move' do
    let(:x) { 2 }
    let(:y) { 2 }

    before do
      robot.x = x
      robot.y = y
      robot.direction = direction

      # knowingly testing a private method
      robot.send(:move)
    end

    context 'when facing north' do
      let(:direction) { 'NORTH' }

      it 'should move one square north' do
        expect(robot.x).to eq(x)
        expect(robot.y).to eq(y + 1)
      end

      context 'when the robot is at the edge of the board' do
        let(:y) { 5 }

        it 'should not move' do
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(y)
        end
      end
    end

    context 'when facing south' do
      let(:direction) { 'SOUTH' }

      it 'should move one square south' do
        expect(robot.x).to eq(x)
        expect(robot.y).to eq(y - 1)
      end

      context 'when the robot is at the edge of the board' do
        let(:y) { 0 }

        it 'should not move' do
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(y)
        end
      end
    end

    context 'when facing east' do
      let(:direction) { 'EAST' }

      it 'should move one square east' do
        expect(robot.x).to eq(x + 1)
        expect(robot.y).to eq(y)
      end

      context 'when the robot is at the edge of the board' do
        let(:x) { 5 }

        it 'should not move' do
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(y)
        end
      end
    end

    context 'when facing west' do
      let(:direction) { 'WEST' }

      it 'should move one square west' do
        expect(robot.x).to eq(x - 1)
        expect(robot.y).to eq(y)
      end

      context 'when the robot is at the edge of the board' do
        let(:x) { 0 }

        it 'should not move' do
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(y)
        end
      end
    end
  end

  describe '#rotate' do
    let(:x) { 2 }
    let(:y) { 2 }

    before do
      robot.x = x
      robot.y = y
      robot.direction = direction
    end

    context 'when facing north' do
      let(:direction) { 'NORTH' }

      it { expect(robot.send(:rotate, 'left')).to eq('WEST') }
      it { expect(robot.send(:rotate, 'right')).to eq('EAST') }
    end

    context 'when facing south' do
      let(:direction) { 'SOUTH' }

      it { expect(robot.send(:rotate, 'left')).to eq('EAST') }
      it { expect(robot.send(:rotate, 'right')).to eq('WEST') }
    end

    context 'when facing east' do
      let(:direction) { 'EAST' }

      it { expect(robot.send(:rotate, 'left')).to eq('NORTH') }
      it { expect(robot.send(:rotate, 'right')).to eq('SOUTH') }
    end

    context 'when facing west' do
      let(:direction) { 'WEST' }

      it { expect(robot.send(:rotate, 'left')).to eq('SOUTH') }
      it { expect(robot.send(:rotate, 'right')).to eq('NORTH') }
    end
  end
end
