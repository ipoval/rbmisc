# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Exceptional do
  describe '#ASSERT' do
    specify 'catches failing block and raises RuntimeError' do
      expect { ASSERT { fail 'Fail message!' } }.to raise_error RuntimeError
    end

    specify 'ok block does not raise error' do
      expect { ASSERT { nil } }.to_not raise_error
    end
  end

  describe '#errors_with_message' do
    specify 'rescue an exception if message match' do
      expect {
        begin
          fail 'Timeout socket'
        rescue errors_with_message(/socket/)
        end
      }.to_not raise_exception
    end

    specify 'do not rescue an exception if no message match' do
      expect {
        begin
          fail 'Timeout without correct token'
        rescue errors_with_message(/socket/)
        end
      }.to raise_exception(RuntimeError, 'Timeout without correct token')
    end
  end
end
