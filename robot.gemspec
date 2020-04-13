lib = File.expand_path 'lib', __dir__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require 'robot/version'

Gem::Specification.new do |spec|
  spec.name          = 'robot'
  spec.version       = Robot::VERSION
  spec.authors       = ['Anton Styagun']
  spec.email         = ['astyagun@ya.ru']

  spec.summary       = 'CLI demo app, that allows to control an imaginary robot'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to? :metadata
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # NOTE Disabled this to remove the warning about absense of .git directory in a Docker container
  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #   f.match %r{^(test|spec|features)/}
  # end
  spec.files         = Dir['README.md', 'lib/**/*', 'exe/robot']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename f }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
