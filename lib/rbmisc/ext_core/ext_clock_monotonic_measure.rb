# frozen_string_literal: true

# [result, time_of_execution_ms]
def clock_monotonic_measure(&block)
  s = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  result = block.()
  f = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  execution_ms = (f - s) * 1000

  [result, execution_ms]
end
