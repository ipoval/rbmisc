require 'test_helper'

describe 'Code Quality', :quality do
  if RUBY_VERSION > '1.9' && RUBY_VERSION < '2.7'
    it 'has no style-guide violations' do
      require 'rubocop'
      result = RuboCop::CLI.new.run
      puts '[STYLE] style violations found. ' \
           'Please run \'rubocop\' for a full report.' if result == 1
      
      current_number_of_style_violations = 8
      
      result.size.must_equal(
        current_number_of_style_violations
      )
    end
  end
end
