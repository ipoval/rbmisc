# encoding: utf-8

module Rubymisc
  module Regex
    class << self
      def email
        email_name_regex  = '[\w\.%\+\-]+'.freeze
        domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
        domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
        /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
      end

      def url
        /\A((http|https):(([A-Za-z0-9$_.+!*(),;\/?:@&~=-])|%[A-Fa-f0-9]{2}){2,}(#([a-zA-Z0-9][a-zA-Z0-9$_.+!*(),;\/?:@&~=%-]*))?([A-Za-z0-9$_+!*();\/?:~-]))\z/
      end

      def zip
        /\A\d{5}(-\d{4})?\z/
      end
    end

    class Manual
      
    end
  end
end
