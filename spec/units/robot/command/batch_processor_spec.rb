require 'spec_helper'

RSpec.describe Robot::Command::BatchProcessor do
  describe '.call' do
    subject(:call) { described_class.call position: position, commands: commands }

    let(:position) { Robot::Position.new }
    let(:commands) { ['PLACE 0,0,SOUTH', 'MOVE', 'REPORT'] }
    let(:some_command_result) { Robot::CommandResult.new position: nil, message: nil }

    describe '.position returned by the call' do
      subject(:returned_position) { call.position }

      context 'when processor returns command results with positions' do
        before do
          allow(Robot::Command::Processor).to receive(:call).and_return \
            some_command_result,
            some_command_result,
            Robot::CommandResult.new(position: some_position, message: nil)
        end

        let(:some_position) { Robot::Position.new }

        it 'equals position from the last command result' do
          expect(returned_position).to eq some_position
        end
      end
    end

    describe '.messages returned by the call' do
      subject(:messages) { call.messages }

      context 'when processor returns command results with messages' do
        before do
          allow(Robot::Command::Processor).to receive(:call).and_return \
            Robot::CommandResult.new(position: nil, message: 'MESSAGE1'),
            some_command_result,
            Robot::CommandResult.new(position: nil, message: 'MESSAGE2')
        end

        it 'equals messages from all command results' do
          expect(messages).to eq %w[MESSAGE1 MESSAGE2]
        end
      end
    end
  end
end
