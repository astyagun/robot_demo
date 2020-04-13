require 'spec_helper'
require 'robot/cli/file_parser'

RSpec.describe Robot::Cli::FileParser do
  describe '.call' do
    subject { described_class.call commands }

    let :commands do
      <<~CMD
        PLACE 0,0,SOUTH
        MOVE
        REPORT
      CMD
    end

    it { is_expected.to eq ['PLACE 0,0,SOUTH', 'MOVE', 'REPORT'] }

    context 'when commands argument is an empty String' do
      let(:commands) { '' }

      it { is_expected.to eq [] }
    end

    context 'when commands argument is nil' do
      let(:commands) { nil }

      it { is_expected.to eq [] }
    end
  end
end
