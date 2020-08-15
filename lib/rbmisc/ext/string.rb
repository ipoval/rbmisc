# encoding: utf-8

module Rbmisc
  module String
    def ^(key)
      key_bytes = key.bytes.cycle
      xor_proc = ->(byte) { byte ^ key_bytes.next }
      bytes.map(&xor_proc).pack('C*').force_encoding(encoding)
    end

    alias_method :xor, :^
  end
end

::String.module_eval 'include Rbmisc::String'
