# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Exceptional do
  describe '#ASSERT' do
    specify 'catches failing block and swallows the exception' do
      failing_proc = -> { fail SecurityError.new('Fail message!') }
      expect { ASSERT &failing_proc }.not_to raise_error
    end

    specify 'ok block does not raise error' do
      success_proc = -> { true }
      expect { ASSERT &success_proc }.to_not raise_error
    end
  end

  describe '#errors_with_message' do
    specify 'rescue an exception if message match' do
      e_socket = -> {
        begin; fail 'Timeout socket'; rescue errors_with_message(/socket/); end
      }
      expect(&e_socket).to_not raise_exception
    end

    specify 'do not rescue an exception if no message match' do
      e_none_socket = -> {
        begin; fail 'Timeout without correct token'; rescue errors_with_message(/socket/); end
      }
      expect(&e_none_socket).to raise_exception(RuntimeError, 'Timeout without correct token')
    end
  end

  describe NestedException do
    specify 'wraps $! exception' do
      begin
        fail 'OriginalException'
      rescue => e_original
        begin
          raise NestedException, e_original.message + '::NestingException'
        rescue => e_nesting
          e_nesting.should respond_to :original
          e_nesting.original.should be e_original
          e_nesting.message.should          == 'OriginalException::NestingException'
          e_nesting.original.message.should == 'OriginalException'
        end
      end
    end
  end
end
