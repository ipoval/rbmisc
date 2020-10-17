# encoding: utf-8

module Rbmisc
  module Object
    def in?(collection)
      collection.respond_to?(:include?) ? collection.include?(self) : false
    end

    def not
      _not_functor = ->(op, *a, &b) { !__send__(op, *a, &b) }

      _not_functor.singleton_class.module_eval <<-CODE, __FILE__, __LINE__ + 1
        def method_missing(method, *args, &block)
          call method, *args, &block
        end
      CODE

      _not_functor
    end

    def and_try
      _and_try_functor = BasicObject.new
      (class << _and_try_functor; self; end).module_eval do
        attr_accessor :delegate_to

        def method_missing(method, *args, &block)
          delegate_to ? delegate_to.__send__(method, *args, &block) : delegate_to
        end
      end
      _and_try_functor.delegate_to = self
      _and_try_functor
    end
  end
end

::Object.module_eval 'include Rbmisc::Object'
