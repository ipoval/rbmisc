require 'pp'
require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true

##
#  @example
#    time { 1_000_000.times { 'word'.upcase } }
#
def time(&block)
  require 'benchmark'
  result = nil
  timing = Benchmark.measure { result = block.() }
  puts "It took: #{timing}"
  result
end
