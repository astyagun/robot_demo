require 'spec_helper'

RSpec.describe Robot::Command::Registry do
  # Testing a subclass to not interfere with the global singleton and to have a fresh instance for each test
  let(:registry) { Class.new described_class }

  describe '.add' do
    subject(:add) { registry.add command, command_class }

    let(:command) { 'STRING123' }
    let(:command_class) { String }

    it 'adds command into the registry' do
      expect { add }.to change { registry.lookup command }.from(Robot::Command::Unrecognized).to command_class
    end
  end

  describe '.lookup' do
    subject(:lookup) { registry.lookup lookup_command }

    before { registry.add command, command_class }

    let(:command) { 'STRING123' }
    let(:command_class) { String }
    let(:lookup_command) { command }

    it { is_expected.to eq command_class }

    context 'when command has several words' do
      let(:lookup_command) { 'STRING123 and some other words' }

      it { is_expected.to eq command_class }
    end

    context 'when command is lowercase' do
      let(:lookup_command) { 'string123' }

      it { is_expected.to eq command_class }
    end

    context 'when command is not recognized' do
      let(:lookup_command) { 'NUMBER456' }

      it { is_expected.to be Robot::Command::Unrecognized }
    end

    context 'when command is empty' do
      let(:lookup_command) { '' }

      it { is_expected.to be Robot::Command::Unrecognized }
    end
  end
end
