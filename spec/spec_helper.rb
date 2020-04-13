$LOAD_PATH.unshift File.expand_path '../lib', __dir__
require 'robot'

require 'aruba/rspec'
require 'pry'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = :random
  Kernel.srand config.seed
end
