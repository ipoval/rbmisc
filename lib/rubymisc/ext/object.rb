# encoding: utf-8

module Rubymisc
  module Object
    def in?(collection)
      collection.respond_to?(:include?) ? collection.include?(self) : false
    end

    def not
      not_functor = lambda { |op, *a, &b| !self.__send__(op, *a, &b) }

      not_functor.singleton_class.module_eval <<-CODE
        def method_missing(method, *arguments, &block)
          call(method, *arguments, &block)
        end
      CODE

      not_functor
    end
  end
end

::Object.module_eval 'include Rubymisc::Object'
