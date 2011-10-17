# encoding: utf-8

module Rubymisc
  module Regex
    class << self
      def email
        /^\w{2,}@\w{2,}\.\w{2,3}$/
      end

      def url
      end
    end
  end
end
