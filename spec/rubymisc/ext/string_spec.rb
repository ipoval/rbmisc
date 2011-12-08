# encoding: utf-8

require 'spec_helper'

describe Rubymisc::String do
  let(:test_string) { 'rubymisc' }

  describe '#^' do
    context 'given string key as an argument', :string_key => 'test' do
      specify "returns the result of xor operation between the receiver's bytes and the string_key's bytes" do
        test_string.should respond_to(:^)
        test_string.should_not == test_string ^ example.metadata[:string_key]
        test_string.should == test_string ^ example.metadata[:string_key] ^ example.metadata[:string_key]
      end
    end
  end
end
