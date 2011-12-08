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

      specify 'return certain value' do
        (test_string ^ example.metadata[:string_key]).should == "\u0006\u0010\u0011\r\u0019\f\u0000\u0017"
      end
    end
  end

  describe '#xor' do
    context 'alias for ^', :string_key => 'test' do
      specify "returns the result of xor operation between the receiver's bytes and the string_key's bytes" do
        test_string.should respond_to(:xor)
        test_string.should_not == test_string.xor(example.metadata[:string_key])
        test_string.should == test_string.xor(example.metadata[:string_key]).xor(example.metadata[:string_key])
      end

      specify 'return certain value' do
        (test_string.xor(example.metadata[:string_key])).should == "\u0006\u0010\u0011\r\u0019\f\u0000\u0017"
      end
    end
  end
end
