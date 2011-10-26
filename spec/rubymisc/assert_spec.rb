# encoding: utf-8

require 'spec_helper'

include Rubymisc

describe 'Rubymisc' do
  describe '#ASSERT' do
    specify 'catches failing block and raises RuntimeError' do
      expect {
        ASSERT {
          fail 'Fail message!'
        }
      }.to raise_error(RuntimeError, 'ASSERT ERROR')
    end

    specify 'ok block does not raise error' do
      expect {
        ASSERT { nil }
      }.to_not raise_error
    end
  end
end
