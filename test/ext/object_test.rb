# encoding: utf-8

require 'test_helper'

describe Rbm::Object do
  let(:collection) { [1, 2, 3, 4, 5, 100] }

  describe '#in?' do
    describe 'given collection includes element' do
      it 'returns true' do
        _(100.in?(collection)).must_equal true
      end
    end

    describe 'given collection does not include element' do
      it 'returns false' do
        _(101.in?(collection)).must_equal false
      end
    end
  end

  describe '#not Functor' do
    it 'String#empty? returns false for blank string with #not Functor' do
      assert ''.empty?
      refute ''.not.empty?
    end

    it 'Object#instance_of? returns false when class matches with #not Functor' do
      assert 100.instance_of?(Integer)
      refute 100.not.instance_of?(Integer)
    end

    it 'Enumerable#include? returns false for collection having an element with #not Functor' do
      assert collection.include?(1)
      refute collection.not.include?(1)
    end
  end

  describe '#and_try Functor' do
    it 'returns nil if nil is a receiver' do
      _(nil).must_respond_to :and_try
      assert_nil nil.and_try.size
    end

    it 'returns false if false is a receiver' do
      _(false).must_respond_to :and_try
      expect { false.and_try.size }
    end

    it 'returns 11 for "test string".and_try.size' do
      assert_equal 'test string'.and_try.size, 11
    end
  end
end
