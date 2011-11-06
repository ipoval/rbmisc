# encoding: utf-8

module Rubymisc
  module Exceptional
    def ASSERT(&block)
      begin
        yield
      rescue StandardError => e
        STDERR.puts e.inspect
        STDERR.puts e.backtrace
        raise RuntimeError, "#{e.message}", caller
      end
    end
  end

  # begin
  #   raise "Timeout socket"
  # rescue errors_with_message(/socket/)
  #   puts "Socket error here"
  # end
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

  # rescue => error
  #   raise NestedException.new('Error B', error)
  # end
  #
  # rescue
  #   raise NestedException, 'Error B'
  # end
  #
  class NestedException < StandardError
    attr_reader :original
    def initialize(msg, original = $!)
      super(msg)
      @original = original
    end
  end
end
