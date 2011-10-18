# encoding: utf-8

require 'spec_helper'

describe Rubymisc::VERSION do
  it { should =~ /\A\d+\.\d+\.\d+\z/ }
end
