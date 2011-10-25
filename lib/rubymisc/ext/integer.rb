# encoding: utf-8

module Rubymisc
  module Integer
    def percent_of(number)
      self.to_f * 100 / number
    end
  end
end
