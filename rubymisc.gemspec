# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)
require 'rubymisc/version'

Gem::Specification.new do |s|
  s.name        = 'rubymisc'
  s.version     = Rubymisc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ivan Povalyukhin']
  s.email       = ['ipoval@ya.ru']
  s.homepage    = 'https://github.com/ipoval/rubymisc'
  s.summary     = %q{Ruby miscellaneous.}
  s.description = %q{Miscellaneous and humble tool-set of useful Ruby.}

  s.rubyforge_project = 'rubymisc'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.3.5'

  { rspec:     '~> 2.8.0.rc1',
    rake:      '~> 0.9.2',
    bundler:   '~> 1.0.21',
    simplecov: '~> 0.5.4' }.each { |lib, v| s.add_development_dependency lib, v }
end
