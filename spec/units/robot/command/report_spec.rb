require 'spec_helper'

RSpec.describe Robot::Command::Report do
  describe '.call' do
    subject(:call) { described_class.call position_command }

    let(:direction) { 'NORTH' }
    let(:position) { Robot::Position.new x: x, y: y, direction: direction }
    let(:position_command) { instance_double Robot::PositionCommand, position: position }
    let(:x) { 3 }
    let(:y) { 1 }

    describe '.message returned by the call' do
      subject { call.message }

      it { is_expected.to eq '3,1,NORTH' }

      context 'when #x is nil' do
        let(:x) { nil }

        it { is_expected.to eq ',1,NORTH' }
      end

      context 'when #y is nil' do
        let(:y) { nil }

        it { is_expected.to eq '3,,NORTH' }
      end

      context 'when #direction is nil' do
        let(:direction) { nil }

        it { is_expected.to eq '3,1,' }
      end
    end
  end
end
