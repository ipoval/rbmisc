# encoding: utf-8

require 'test_helper'

describe '#clock_monotonic_measure' do
  it '#clock_monotonic_measure returns result and time' do
    result, ms = clock_monotonic_measure do
      sleep(0.1)
      "ok"
    end

    assert_equal "ok", result
    assert_in_delta 100, ms, 50
  end
end
