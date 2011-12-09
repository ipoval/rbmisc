# encoding: utf-8

if defined?(ActiveRecord)
  module Rubymisc
    module ArValidates
      def validates_url(attribute = :url)
        validates_presence_of attribute
        validates_length_of attribute, :minimum => 12
        validates_format_of attribute, :with => Regex.url, :message => %/isn't a valid URL./
      end

      def validates_email(attribute = :email)
        validates_presence_of attribute
        validates_length_of attribute, :minimum => 5
        validates_format_of attribute, :with => Regex.email, :message => %/isn't a valid email./
      end

      def validates_image_url(attribute = :image_url)
        validates attribute, allow_blank: true, format: {
          with: %r{\.(gif|jpg|png)$}i,
          message: 'must be a URL for GIF, JPG or PNG image.'
        }
      end
    end

    ActiveRecord::Base.extend ArValidates
  end
end
