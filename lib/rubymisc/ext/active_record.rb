# encoding: utf-8

if defined?('ActiveRecord')
  module ValidatesUrl
    def validates_url(attribute = :url)
      validates_presence_of attribute
      validates_length_of attribute, :minimum => 12
      url_re = /^((http|https):(([A-Za-z0-9$_.+!*(),;\/?:@&~=-])|%[A-Fa-f0-9]{2}){2,}(#([a-zA-Z0-9][a-zA-Z0-9$_.+!*(),;\/?:@&~=%-]*))?([A-Za-z0-9$_+!*();\/?:~-]))/
      validates_format_of attribute, :with => url_re, :message => "isn't a valid URL."
    end
  end

  module ValidatesEmail
    def validates_email(attribute = :email)
      validates_presence_of attribute
      validates_length_of attribute, :minimum => 5
      email_re = /^/
      validates_format_of attribute, :with => email_re, :message => "isn't a valid email."
    end
  end
end
