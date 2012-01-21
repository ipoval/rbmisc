# encoding: utf-8

module Rubymisc
  module Object
    def in?(collection)
      collection.respond_to?(:include?) ? collection.include?(self) : false
    end

    def not
      _not_functor = ->(op, *a, &b) { !self.__send__(op, *a, &b) }

      _not_functor.singleton_class.module_eval <<-CODE
        def method_missing(method, *args, &block)
          call method, *args, &block
        end
      CODE

      _not_functor
    end

    def and_try
      receiver = self

      _and_try_functor = BasicObject.new
      _and_try_functor.singleton_class.module_eval do
        def delegate_to
          @delegate_to = receiver
        end

        
      end


      _and_try_functor = ->(op, *a, &b) { self ? self.__send__(op, *a, &b) : self }

      _and_try_functor.singleton_class.module_eval <<-CODE
        def method_missing(method, *args, &block)
          call method, *args, &block
        end
      CODE

      _and_try_functor
    end
  end
end

::Object.module_eval 'include Rubymisc::Object'
