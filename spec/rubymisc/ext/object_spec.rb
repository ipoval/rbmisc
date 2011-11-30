# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Object do
  let(:collection) { [1, 2, 3, 4, 5, 100] }

  describe '#in?' do
    context 'given collection includes element' do
      specify 'returns true' do
        100.in?(collection).should be_true
      end
    end

    context 'given collection does not include element' do
      specify 'returns false' do
        101.in?(collection).should be_false
      end
    end
  end

  describe '#not Functor' do
    specify 'String#empty? returns false for blank string with #not Functor' do
      ''.empty?.should be true
      ''.not.empty?.should be false
    end

    specify 'Enumerable#include? returns false for collection having an element with #not Functor' do
      collection.include?(1).should be true
      collection.not.include?(1).should be false
    end
  end
end
