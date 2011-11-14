# encoding: utf-8

module Rubymisc
  module Regex
    class Manual
      def self.man
        <<-EOS
Ruby character representations
------------------------------
  Sequence        Meaning
  \\a              Alert (bell), \\x07.
  \\b              Backspace, \\x08, supported only in character class.
  \\e              ESC character, \\x1B.
  \\n              Newline, \\x0A.
  \\r              Carriage return, \\x0D.
  \\f              Form feed, \\x0C.
  \\t              Horizontal tab \\x09.
  \\v              Vertical tab, \\x0B.
  \\0octal         Character specified by a two-digit octal code.
  \\xhex           Character specified by a two-digit hexadecimal code.
  \\cchar          Named control character.
        EOS
      end
    end
  end
end
