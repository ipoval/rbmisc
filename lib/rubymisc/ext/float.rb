# encoding: utf-8

module Rubymisc
  module Float
    def percent_of(number)
      self * 100 / number
    end
  end
end

::Float.module_eval 'include Rubymisc::Float'
