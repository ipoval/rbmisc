# encoding: utf-8

module Rubymisc
  module String
    def ^(key)
      key_num = key.bytes.cycle
      bytes.map { |byte| byte ^ key_num.next }.pack('C*').force_encoding(self.encoding)
    end
  end
end

::String.module_eval 'include Rubymisc::String'
