# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Float do
  describe '#percent_of' do
    specify '50.0 is 50.0 percent of 100' do
      (50.0).percent_of(100).should be_kind_of Float
      (50.0).percent_of(100).should == 50.0
    end

    specify '0.0 is 0.0 percent of 100' do
      (0.0).percent_of(100).should be_kind_of Float
      (0.0).percent_of(100).should == 0.0
    end
  end
end
