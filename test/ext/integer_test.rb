# encoding: utf-8

require 'test_helper'

describe Rbm::Integer do
  describe '#percent_of' do
    it '50 is 50.0 percent of 100' do
      _(50.percent_of(100)).must_be_kind_of Float
      assert_equal 50.percent_of(100), 50.0
    end

    it '0 is 0.0 percent of 100' do
      _(0.percent_of(100)).must_be_kind_of Float
      assert_equal 0.percent_of(100), 0.0
    end
  end
end
