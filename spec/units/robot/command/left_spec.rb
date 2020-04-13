require 'spec_helper'

RSpec.describe Robot::Command::Left do
  describe '.call' do
    subject(:call) { described_class.call position_command }

    let(:direction) { 'NORTH' }
    let(:position) { Robot::Position.new x: x, y: y, direction: direction }
    let(:position_command) { instance_double Robot::PositionCommand, position: position }
    let(:x) { 3 }
    let(:y) { 1 }

    describe '.position returned by the call' do
      subject { call.position }

      it { is_expected.to have_attributes x: x, y: y, direction: 'WEST' }

      context 'when #direction is EAST' do
        let(:direction) { 'EAST' }

        it { is_expected.to have_attributes x: x, y: y, direction: 'NORTH' }
      end

      context 'when #direction is SOUTH' do
        let(:direction) { 'SOUTH' }

        it { is_expected.to have_attributes x: x, y: y, direction: 'EAST' }
      end

      context 'when #direction is WEST' do
        let(:direction) { 'WEST' }

        it { is_expected.to have_attributes x: x, y: y, direction: 'SOUTH' }
      end

      context 'when #direction is lowercase' do
        let(:direction) { 'north' }

        it { is_expected.to have_attributes x: x, y: y, direction: 'WEST' }
      end

      context 'when #direction is nil' do
        let(:direction) { nil }

        it { is_expected.to have_attributes x: x, y: y, direction: direction }
      end

      context 'when #direction is an Integer' do
        let(:direction) { 10 }

        it { is_expected.to have_attributes x: x, y: y, direction: direction }
      end

      context 'when #direction is unrecognized' do
        let(:direction) { 'UP' }

        it { is_expected.to have_attributes x: x, y: y, direction: direction }
      end
    end
  end
end
