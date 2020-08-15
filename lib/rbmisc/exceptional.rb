# encoding: utf-8

module Rbmisc
  module Exceptional
    ##
    # @example
    #   begin
    #     raise 'Timeout socket'
    #   rescue errors_with_message /socket/
    #     p 'socket E'
    #   end
    #
    def errors_with_message(pattern)
      m = Module.new
      (class << m; self; end).instance_eval do
        define_method(:===) { |e| pattern === e.message }
      end
      m
    end

    ##
    # @example
    #   rescue => e; raise NestedException.new('Error B', e); end
    #   rescue; raise NestedException, 'Error B'; end
    #
    class NestedException < StandardError
      attr :original

      def initialize(msg, original = $!)
        super(msg)
        @original = original
      end
    end
  end
end

::Object.module_eval 'include Rbmisc::Exceptional'
