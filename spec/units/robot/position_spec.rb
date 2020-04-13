require 'spec_helper'

RSpec.describe Robot::Position do
  describe '#valid?' do
    subject { instance.valid? }

    let(:direction) { 'NORTH' }
    let(:instance) { described_class.new x: x, y: y, direction: direction }
    let(:x) { nil }
    let(:y) { nil }

    it { is_expected.to be false }

    context 'when x and y are 0' do
      let(:x) { 0 }
      let(:y) { 0 }

      it { is_expected.to be true }

      context 'and direction is EAST' do
        let(:direction) { 'EAST' }

        it { is_expected.to be true }
      end

      context 'and direction is SOUTH' do
        let(:direction) { 'SOUTH' }

        it { is_expected.to be true }
      end

      context 'and direction is WEST' do
        let(:direction) { 'WEST' }

        it { is_expected.to be true }
      end

      context 'and direction is unrecornized' do
        let(:direction) { 'LEFT' }

        it { is_expected.to be false }
      end

      context 'and direction is nil' do
        let(:direction) { nil }

        it { is_expected.to be false }
      end

      context 'and direction is and integer' do
        let(:direction) { 10 }

        it { is_expected.to be false }
      end
    end

    context 'when x and y are 4' do
      let(:x) { 4 }
      let(:y) { 4 }

      it { is_expected.to be true }
    end

    context 'when x is 5 and y is 4' do
      let(:x) { 5 }
      let(:y) { 4 }

      it { is_expected.to be false }
    end

    context 'when x is 4 and y is 5' do
      let(:x) { 4 }
      let(:y) { 5 }

      it { is_expected.to be false }
    end

    context 'when x is 4 and y is 5000' do
      let(:x) { 4 }
      let(:y) { 1000 }

      it { is_expected.to be false }
    end

    context 'when x is 0 and y is -1' do
      let(:x) { 0 }
      let(:y) { -1 }

      it { is_expected.to be false }
    end

    context 'when x is -1 and y is 0' do
      let(:x) { -1 }
      let(:y) { 0 }

      it { is_expected.to be false }
    end

    context 'when x is -1000 and y is 0' do
      let(:x) { -1000 }
      let(:y) { 0 }

      it { is_expected.to be false }
    end

    context 'when x is 3 and y is unset' do
      let(:x) { 3 }

      it { is_expected.to be false }
    end

    context 'when x is unset and y is 2' do
      let(:y) { 2 }

      it { is_expected.to be false }
    end

    context 'when x is 4 and y is a string' do
      let(:x) { 4 }
      let(:y) { '1' }

      it { is_expected.to be false }
    end
  end
end
