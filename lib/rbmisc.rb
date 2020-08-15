# encoding: utf-8

# This module encapsulates the entry point functionality to the extension modules.
#--
# Copyright (c) 2013 Ivan Povalyukhin.
# Licensed under the same terms as Ruby. No warranty is provided.

require "rbmisc/version"

module Rbmisc
  class Error < StandardError; end

  class << self
    def _ext_load(prefix = '') #:nodoc:
      ->(file) { require_relative prefix + file }
    end
    private :_ext_load
  end
end

Dir[
  File.expand_path('../rbmisc/ext/*.rb', __FILE__)
].each(
  &Rbmisc.send(:_ext_load)
)

%w(
  self
  regex
  exceptional
  assertions
  price_helper
).each(
  &Rbmisc.send(:_ext_load, './rbmisc/')
)

# Shorter namespace
module Rbm
  include Rbmisc
  extend Rbmisc
end
