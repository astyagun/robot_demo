require 'spec_helper'
require 'robot/cli'

RSpec.describe Robot::Cli, type: :aruba do
  describe '#call' do
    subject(:call) { instance.call }

    before { allow(Robot).to receive(:new).and_return robot_instance }

    let!(:file) { write_file file_name, commands }
    let(:instance) { described_class.new file_name: file_path, output: output }
    let(:robot_instance) { instance_double Robot, process_commands: [] }
    let :commands do
      <<~CMD
        PLACE 0,0,SOUTH
        MOVE
        REPORT
      CMD
    end
    let(:file_name) { 'commands.txt' }
    let(:file_path) { expand_path file_name }
    let(:output) { StringIO.new }

    it 'passes contents of a file to Robot::Command::BatchProcessor' do
      call
      expect(robot_instance).to have_received(:process_commands).with ['PLACE 0,0,SOUTH', 'MOVE', 'REPORT']
    end

    context 'when Robot::Command::BatchProcessor.call returns a result' do
      before { allow(robot_instance).to receive(:process_commands).and_return ['Text result', 'And result'] }

      it 'prints this result to the log' do
        call
        expect(output.string).to eq "Text result\nAnd result\n"
      end
    end

    context "when file doesn't exist" do
      let!(:file) {}

      it 'prints message to output' do
        call
        expect(output.string).to include 'Please provide the name of a file with commands for your robot'
      end
    end

    context 'when file_name is empty' do
      let!(:file) {}
      let(:file_path) { '' }

      it 'prints message to output' do
        call
        expect(output.string).to include 'Please provide the name of a file with commands for your robot'
      end
    end

    context 'when file_name is nil' do
      let!(:file) {}
      let(:file_path) { nil }

      it 'prints message to output' do
        call
        expect(output.string).to include 'Please provide the name of a file with commands for your robot'
      end
    end
  end
end
