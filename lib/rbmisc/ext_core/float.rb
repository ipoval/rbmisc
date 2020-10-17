# encoding: utf-8

# Extend Float class
module Rbmisc
  module Float
    def try_int
      to_i == self ? to_i : self
    end

    def percent_of(number)
      self * 100 / number
    end
  end
end

::Float.module_eval 'include Rbmisc::Float'
