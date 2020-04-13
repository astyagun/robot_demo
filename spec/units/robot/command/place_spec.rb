require 'spec_helper'

RSpec.describe Robot::Command::Place do
  describe '.call' do
    subject(:call) { described_class.call position_command }

    let(:command) { 'PLACE 1,2,NORTH' }
    let(:position_command) { instance_double Robot::PositionCommand, command: command }

    describe '.position returned by the call' do
      subject(:returned_position) { call.position }

      it { is_expected.to have_attributes x: 1, y: 2, direction: 'NORTH' }

      context 'when command arguments are missing' do
        let(:command) { 'PLACE' }

        it { is_expected.to have_attributes x: nil, y: nil, direction: nil }
      end

      context 'when only one command argument is given' do
        let(:command) { 'PLACE 2' }

        it { is_expected.to have_attributes x: 2, y: nil, direction: nil }
      end

      context 'when only two command arguments are given' do
        let(:command) { 'PLACE 3,4' }

        it { is_expected.to have_attributes x: 3, y: 4, direction: nil }
      end

      context 'when coommand has white space between arguments' do
        let(:command) { 'PLACE  4 ,  5  , EAST  ' }

        it { is_expected.to have_attributes x: 4, y: 5, direction: 'EAST' }
      end

      context 'when direction command argument is lowercase' do
        let(:command) { 'PLACE 1,2,east' }

        it { is_expected.to have_attributes x: 1, y: 2, direction: 'EAST' }
      end

      context 'when command #x argument starts with a number, but has non-numeric characters' do
        let(:command) { 'PLACE 1str,3,EAST' }

        it { is_expected.to have_attributes x: nil }
      end

      context 'when command #y argument starts with a number, but has non-numeric characters' do
        let(:command) { 'PLACE 1,3abc,EAST' }

        it { is_expected.to have_attributes y: nil }
      end

      context 'when command #x argument is not numeric' do
        let(:command) { 'PLACE abracadabra,2,EAST' }

        it { is_expected.to have_attributes x: nil }
      end

      context 'when command #y argument is not numeric' do
        let(:command) { 'PLACE 1,simsalabim,EAST' }

        it { is_expected.to have_attributes y: nil }
      end
    end
  end
end
