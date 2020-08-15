# encoding: utf-8

module Rbmisc
  module Float
    def percent_of(number)
      self * 100 / number
    end
  end
end

::Float.module_eval 'include Rbmisc::Float'
