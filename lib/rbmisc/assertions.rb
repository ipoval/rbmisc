# encoding: utf-8

module Rbmisc
  # overwrite with no-op method on production
  # Assertions.module_eval do
  #   def assert; end
  # end
  module Assertions
    class AssertionFailedError < StandardError; end

    def assert(&condition)
      fail AssertionFailedError.new('Assertion Failed') unless condition.call
    end
  end
end
