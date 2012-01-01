# encoding: utf-8

# This module encapsulates the entry point functionality to
# the extension modules.
#--
# Copyright (c) 2011 Ivan Povalyukhin.
# Licensed under the same terms as Ruby. No warranty is provided.
module Rubymisc
  class << self
    def rbm_ext_load(ext_prefix = '') #:nodoc:
      ->(ext_file) { require ext_prefix + ext_file }
    end
    private :rbm_ext_load
  end
end

Dir[File.expand_path('../rubymisc/ext/*.rb', __FILE__)].each &Rubymisc.send(:rbm_ext_load)
%w{ self version regex exceptional }.each &Rubymisc.send(:rbm_ext_load, 'rubymisc/')

module Rbm
  include Rubymisc
  extend Rubymisc
end

__END__
# Copyright (c) 2011 Ivan Povalyukhin.
