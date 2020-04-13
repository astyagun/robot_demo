require 'spec_helper'

RSpec.describe Robot::Command::Processor do
  describe '.call' do
    subject(:call) { described_class.call position_command }

    let(:command) { 'MOVE' }
    let(:original_position) { Robot::Position.new x: 3, y: 2, direction: 'WEST' }
    let(:position_command) { Robot::PositionCommand.new position: original_position, command: command }

    describe '.position.x returned by the call' do
      subject(:returned_position_x) { call.position.x }

      it 'equals #x of a new position' do
        expect(returned_position_x).to eq 2
      end

      context 'when command is unrecognized' do
        let(:command) { 'JUMP' }

        it 'equals #x of an old position' do
          expect(returned_position_x).to eq 3
        end
      end
    end

    describe '.message returned by the call' do
      subject { call.message }

      context 'when command class lookup fails' do
        let(:command) { 'TURNAROUND' }

        it { is_expected.to eq %(Command "#{command}" was not recognized) }
      end
    end
  end
end
