# encoding: utf-8

require 'spec_helper'

describe 'Rubymisc::Regex::Manual' do
  specify '.man' do
    Rubymisc::Regex.man.should == <<-EOS
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
