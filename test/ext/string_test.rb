# encoding: utf-8

require 'test_helper'

describe Rbm::String do
  let(:a_str) { 'rbmisc' }
  let(:string_key) { 'test' }

  describe '#^' do
    describe 'given string key as an argument', string_key: 'test' do
      it "returns the result of xor operation between the receiver's bytes and the string_key's bytes" do
        _(a_str).must_respond_to(:^)
        _(a_str).wont_equal(a_str ^ string_key)
        _(a_str).must_equal(a_str ^ string_key ^ string_key)
      end

      it 'return certain value' do
        assert_equal (a_str ^ string_key),
          "\u0006\a\u001E\u001D\a\u0006"
      end
    end
  end

  describe '#xor' do
    describe 'alias for ^', string_key: 'test' do
      it "returns the result of xor operation between the receiver's bytes and the string_key's bytes" do
        _(a_str).must_respond_to(:xor)
        _(a_str).wont_equal a_str.xor(string_key)
        _(a_str).must_equal a_str.xor(string_key).xor(string_key)
      end

      it 'return certain value' do
        _(a_str.xor(string_key)).must_equal(
          "\u0006\a\u001E\u001D\a\u0006"
        )
      end
    end
  end
end
