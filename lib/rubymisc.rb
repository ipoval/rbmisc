# encoding: utf-8

module Rubymisc
  class << self
    def log_at_exit_error
    end
  end
end

Dir[File.expand_path('../rubymisc/ext/*.rb', __FILE__)].each &(load_rubymisc_ext = ->(file) { require file })

require 'rubymisc/regex'
require 'rubymisc/exceptional'
require 'rubymisc/version'

__END__
###
# Copyright (C) 2011 Ivan Povalyukhin.
###
