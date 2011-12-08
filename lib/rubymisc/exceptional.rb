# encoding: utf-8

module Rubymisc
  module Exceptional
    def ASSERT(&block)
      begin
        yield
      rescue Exception => e
        STDERR.puts e.inspect
        STDERR.puts e.backtrace
        # raise e.class, "#{e.message}", caller
      end
    end

    ##
    # @example
    #   begin; raise 'Timeout socket'; rescue errors_with_message(/socket/); p 'socket E'; end
    #
    def errors_with_message(pattern)
      m = Module.new
      (class << m; self; end).instance_eval do
        define_method(:===) do |e|
          pattern === e.message
        end
      end
      m
    end

    ##
    # @example
    #   rescue => e; raise NestedException.new('Error B', e); end
    #   rescue; raise NestedException, 'Error B'; end
    #
    class NestedException < StandardError
      attr_reader :original
      def initialize(msg, original = $!)
        super(msg)
        @original = original
      end
    end
  end
end

::Object.module_eval 'include Rubymisc::Exceptional'
