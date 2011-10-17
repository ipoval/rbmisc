# encoding: utf-8

require 'spec_helper'

describe Rubymisc::VERSION do
  subject { Rubymisc::VERSION }

  it { should =~ /\A\d+\.\d+\.\d+\z/ }
end
