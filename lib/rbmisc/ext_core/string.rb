# frozen_string_literal: true

module Rbmisc
  module String
    def ^(key)
      key_bytes = key.bytes.cycle
      xor_proc = ->(byte) { byte ^ key_bytes.next }
      bytes.map(&xor_proc).pack('C*').force_encoding(encoding)
    end

    alias_method :xor, :^

    def not_eql?(other)
      functor_not_eql?.call(self, other)
    end
  end
end

::String.module_eval <<-STR, __FILE__, __LINE__ + 1
  include Rbmisc::String
STR
