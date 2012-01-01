# encoding: utf-8

require 'spec_helper'

describe Rbm::VERSION do
  it { should =~ /\A\d+\.\d+\.\d+(\.\d+)?\z/ }
end
