# encoding: utf-8
# $:.push File.expand_path('../lib', __FILE__)
require_relative 'lib/rbmisc/version'

Gem::Specification.new do |spec|
  spec.name          = "rbmisc"
  spec.version       = Rbmisc::VERSION
  spec.authors       = ["DMO"]
  spec.email         = ["ivanpoval@gmail.com"]

  spec.summary       = %q{DMO project: rbmisc}
  spec.description   = %q{DMO project: rbmisc}
  spec.homepage      = "https://github.com/ipoval/rbmisc"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ipoval/rbmisc"
  spec.metadata["changelog_uri"] = "https://github.com/ipoval/rbmisc/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.7.0'

  # { rake:      '~> 10.4.2',
  #   bundler:   '~> 1.12.5',
  #   simplecov: '~> 0.12.0',
  #   rubocop:   '~> 0.41.2' }.each { |lib, v| s.add_development_dependency lib.to_s, v }
end
