# encoding: utf-8

require 'test_helper'

describe Rbmisc::Assertions do
  describe '#assert' do
    let(:asserted_class) { Class.new }

    it 'raises exception if assert condition is false' do
      asserted_class.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        include Rbmisc::Assertions

        def withdraw(amount)
          balance = 100
          assert { amount <= balance }
        end
      RUBY

      _(
        -> {
          asserted_class.new.withdraw(101)
        }
      ).must_raise(Rbmisc::Assertions::AssertionFailedError)
    end
  end
end
