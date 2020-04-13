require 'spec_helper'

RSpec.describe Robot do
  describe '.process_commands' do
    subject(:process_commands) { instance.process_commands commands }

    let(:commands) { ['PLACE 0,0,SOUTH', 'MOVE', 'REPORT'] }
    let(:instance) { described_class.new }
    let(:instance_position) { instance.position }

    it 'passes commands to Robot::Command::BatchProcessor.call' do
      allow(Robot::Command::BatchProcessor).to receive(:call).and_return \
        Robot::CommandsResult.new position: instance_position
      process_commands
      expect(Robot::Command::BatchProcessor).to have_received(:call).with \
        position: instance_position, commands: commands
    end

    it 'updates #position with return value of Robot::Command::BatchProcessor.call' do
      returned_position = Robot::Position.new
      allow(Robot::Command::BatchProcessor).to receive(:call)
        .and_return Robot::CommandsResult.new position: returned_position
      expect { process_commands }.to change(instance, :position).from(instance.position).to returned_position
    end

    it 'returns message returned by Robot::Command::BatchProcessor' do
      allow(Robot::Command::BatchProcessor).to receive(:call)
        .and_return Robot::CommandsResult.new position: nil, messages: 'Message'
      expect(process_commands).to eq 'Message'
    end
  end

  describe '#initialize' do
    subject(:initialize_call) { described_class.new }

    it 'sets #position' do
      expect(initialize_call.position).to be_an_instance_of Robot::Position
    end
  end
end
