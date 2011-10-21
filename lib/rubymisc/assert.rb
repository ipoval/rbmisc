# encoding: utf-8

module Rubymisc
  def ASSERT(&block)
    begin
      yield
    rescue StandardError => e
      puts e.inspect
      puts e.backtrace
      puts 'ASSERT ERROR'

      raise RuntimeError, 'ASSERT ERROR', caller
    end
  end
end
