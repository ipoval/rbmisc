module Rbmisc
  def smart_round(price)
    return if price.nil?
    return price.round    if price >= 100
    return price.round(1) if price >= 30.3
    return price.round(2)
  end

  # Usage:
  # MultiTierPrice.new(last_usage: 250, tiers: { 0..100 => 0.03, 100..200 => 0.05, 200..300 => 0.07 }).base_charge
  # => 11.5
  # or
  # MultiTierPrice.base_charge { |charge|
  #   charge.last_usage = 250,
  #   charge.tiers = { 0..100 => 0.03, 100..200 => 0.05, 200..300 => 0.07 }
  # }
  # --
  class MultiTierPrice
    attr_accessor :usage, :tiers

    def self.base_charge
      multi_tier_price = self.new
      yield multi_tier_price
      multi_tier_price.send(:initialize_tiers, multi_tier_price.tiers)
      multi_tier_price.base_charge
    end

    def initialize(last_usage: 0, tiers: nil)
      @usage = last_usage
      initialize_tiers tiers if tiers
    end

    def base_charge
      @tiers.reduce(0) { |charge, tier| charge + usage_in_range(tier[0]) * tier[1] }
    end

    private

    def initialize_tiers tiers
      last_range, last_charge = tiers.to_a.last

      @tiers = tiers.dup
      @tiers.delete(last_range)
      @tiers.store(last_range.begin..@usage, last_charge)
    end

    def usage_in_range(range)
      usage > range.begin ? [usage, range.end].min - range.begin : 0
    end
  end
end
