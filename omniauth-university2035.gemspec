
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-university2035/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-university2035"
  spec.version       = OmniAuth::University2035::VERSION
  spec.authors       = ["Anton Zagorskii"]
  spec.email         = ["zagorskiianton@yandex.ru"]

  spec.summary       = %q{OmniAuth strategy for university2035}
  spec.description   = %q{OmniAuth strategy for university2035}
  spec.homepage      = "https://github.com/antonzagorskii/omniauth-university2035"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
