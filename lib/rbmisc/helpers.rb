def pcnt_to_f(val)
  val&.fdiv(100)
end

def add_param_to_uri(uri, param_str)
  result = URI.parse(uri)
  result.query = [result.query.presence, param_str].compact.join('&')
  result.to_s
end

# Ruby 2.7.0 methods
# module Enumerable
#   def tally_by(&func)
#     func ||= -> v { v }
#     each_with_object(Hash.new(0)) do |val, hash|
#       hash[func.call(val)] += 1
#     end
#   end
#
#   # NOTE: itself - identity function
#   # An identity function is a function that returns what it was given.
#   # If you give it 1, it returns 1. If you give it true, it returns true.
#   def tally(sorted = false)
#     map = tally_by(&:itself)
#     sorted ? map.sort_by { |_, v| -v }.to_h : map
#   end
# end
