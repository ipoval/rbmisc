require 'test_helper'

class SecurityPriceTest < Minitest::Test
  def test_price_greater_than_100
    assert_equal 100, Rbm.smart_round(100.4)
    assert_equal 101, Rbm.smart_round(100.5)
  end

  def test_price_greater_than_30
    assert_equal 30.5, Rbm.smart_round(30.45)
    assert_equal 30.4, Rbm.smart_round(30.43)
  end

  def test_price
    assert_equal 10.45, Rbm.smart_round(10.45)
    assert_equal 10.43, Rbm.smart_round(10.43)
  end

  def test_price_less_than_1
    assert_equal 0.14, Rbm.smart_round(0.14)
    assert_equal 0.15, Rbm.smart_round(0.145)
  end

  def test_price_with_insignificant_decimal_zero
    assert_same 27, Rbm.smart_round(27.0)
  end
end

include Rbmisc

describe MultiTierPrice do
  let(:multi_tier_price) do
    MultiTierPrice.new(
      last_usage: last_usage,
      tiers: { 0..100 => 0.03, 100..200 => 0.05, 200..300 => 0.07 }
    )
  end

  describe '1st tier price' do
    let(:last_usage) { 50 }

    specify 'calc multi tier price for the first tier' do
      _(multi_tier_price.base_charge).must_equal 1.5
    end
  end

  describe '2nd tier price' do
    let(:last_usage) { 150 }

    specify 'calc multi tier price for the second tier' do
      _(multi_tier_price.base_charge).must_equal 3.0 + 2.5
    end
  end

  describe '3rd tier price' do
    let(:last_usage) { 250 }

    specify 'calc multi tier price for the second tier' do
      _(multi_tier_price.base_charge).must_equal 8.0 + 3.5
    end
  end

  describe '.base_price' do
    specify 'fabric method' do
      result = MultiTierPrice.base_charge do |charge|
        charge.usage = 250
        charge.tiers = { 0..100 => 0.03, 100..200 => 0.05, 200..300 => 0.07 }
      end
      _(result).must_equal 11.5
    end
  end

end
