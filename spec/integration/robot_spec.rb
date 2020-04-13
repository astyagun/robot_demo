require 'spec_helper'

RSpec.describe Robot, type: :aruba do
  subject { run_command "robot #{file_name}" }

  before { write_file file_name, commands }

  let(:file_name) { 'commands.txt' }

  context 'when running with the first set of commands' do
    let :commands do
      <<~CMD
        PLACE 0,0,NORTH
        MOVE
        REPORT
      CMD
    end

    it { is_expected.to have_output '0,1,NORTH' }
  end

  context 'when running with the second set of commands' do
    let :commands do
      <<~CMD
        PLACE 0,0,NORTH
        LEFT
        REPORT
      CMD
    end

    it { is_expected.to have_output '0,0,WEST' }
  end

  context 'when running with the third set of commands' do
    let :commands do
      <<~CMD
        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
      CMD
    end

    it { is_expected.to have_output '3,3,NORTH' }
  end
end
