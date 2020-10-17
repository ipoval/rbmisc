# encoding: utf-8

module Rbmisc
  module Integer
    def percent_of(number)
      self.to_f * 100 / number
    end
  end
end

::Integer.module_eval 'include Rbmisc::Integer'
