require 'spec_helper'

describe Rubymisc::Object do
  describe '#in?' do
    let(:collection) { [1, 2, 3, 4, 5, 100] }

    context 'given collection includes element' do
      specify 'returns true' do
        100.in?(collection).should be_true
      end
    end

    context 'given collection does not include element' do
      specify 'returns false' do
        101.in?(collection).should be_false
      end
    end
  end
end
