# encoding: utf-8

require 'test_helper'

describe Rbm::Exceptional do
  describe '#errors_with_message' do
    specify 'rescue an exception if message match' do
      e_socket = -> {
        begin; fail 'Timeout socket'; rescue errors_with_message(/socket/); end
      }
      # implicit assert_nothing_raised
      e_socket.call
    end

    specify 'do not rescue an exception if no message match' do
      e_none_socket = -> {
        begin; fail 'Timeout without correct token'; rescue errors_with_message(/socket/); end
      }
      _(e_none_socket).must_raise(RuntimeError, 'Timeout without correct token')
    end
  end

  describe NestedException do
    it 'wraps $! exception' do
      begin
        fail 'OriginalException'
      rescue => e_original
        begin
          raise NestedException, e_original.message + '::NestingException'
        rescue => e_nesting
          _(e_nesting).must_respond_to :original
          _(e_nesting.original).must_be_same_as e_original
          _(e_nesting.message).must_equal 'OriginalException::NestingException'
          _(e_nesting.original.message).must_equal 'OriginalException'
        end
      end
    end
  end
end
