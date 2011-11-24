# encoding: utf-8

module Rubymisc
  module Object
    def in?(collection)
      collection.respond_to?(:include?) ? collection.include?(self) : false
    end
  end
end

::Object.class_eval 'include Rubymisc::Object'
