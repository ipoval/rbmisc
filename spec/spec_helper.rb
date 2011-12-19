# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)

require 'simplecov' # use simplecov test coverage
SimpleCov.start

require 'rubymisc'
Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |conf|
  conf.color_enabled = true
  conf.treat_symbols_as_metadata_keys_with_true_values = true

  conf.expect_with :rspec, :stdlib
  conf.mock_with :rspec

  conf.fail_fast = true
  conf.filter_run :focus  => true
  conf.filter_run_excluding :broken => true
  conf.run_all_when_everything_filtered = true
end
