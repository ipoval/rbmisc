# encoding: utf-8

module Rbmisc
  module Regex
    module Manual
      def man
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

Ruby character classses and class-like constructs
-------------------------------------------------
  Class           Meaning
  [...]           A single character listed, or contained within a listed range.
  [^...]          A single character not listed, and not contained within a listed range.
  .               Any character, except a line terminator (unless single-line mode, s).
  \\w              Word character.
  \\W              Nonword character.
  \\d              Digit.
  \\D              Nondigit.
  \\s              Whitespace character, [\\f\\n\\r\\t\\v].
  \\S              Nonwhitespace character, [^\\f\\n\\r\\t\\v].
  \\h              Hexadecimal digit.
  \\H              Negated form of \\h.

Ruby anchors and other zero-width tests
---------------------------------------
  Sequence        Meaning
  ^               Start of string, or the point after any newline.
  \\A              Beginning of string, in all match modes.
  $               End of string, or the point before any newline.
  \\Z              End of string, but before any final line terminator, in all match modes.
  \\z              End of string, in all match modes.
  \\b              Boundary between a \\w character and a \W character.
  \\B              Not-word-boundary.
  \\G              End of the previous match.
  (?=...)         Positive lookahead.
  (?!...)         Negative lookahead.

Ruby comments and mode modifiers
--------------------------------
  Mode character  Meaning
  m               Dot(.) matches any character, including a line terminator.
                  Note that this is different from most regex implementations.
  x               Ignore whitespace, and allow embedded comment starting with #.
  i               Case-insensitive match.
  n               Turn off wide-character processing.
  o               Evaluate \#{...} substitutions only once. Default is to evaluate each time the regex is evaluated.
  (?imns-imns)    Turn match flags on or off for the rest of pattern.
  (?imns-imns:    Turn match flags on or off for the rest of the subexpression.
  ...)
  (?#...)         Treat substring as a comment.
  #...            Treat rest of line as a comment in /x mode.
  (?<=...)        Positive lookbehind.
  (?<!...)        Negative lookbehind.

Ruby grouping, capturing, conditional and control
-------------------------------------------------
  Sequence        Meaning
  (...)           Grouping. Submatches fill \\1, \\2, ... and $1, $2, ...
  (?<name>...)    Named captured. Grouped match will fill \\k<name>.
  \\n              In a regular expression, match what was matched by the nth earlier submatch.
  $n              In a replacement string, contains the nth earlier submatch.
  \\k<name>        In a replacement string, contains the named submatch name.
  (?:...)         Grouping-only parentheses, no capturing.
  (?>...)         Atomic grouping.
  ...|...         Alternation; match one or the other.
  *               Match 0 or more times.
  +               Match 1 or more times.
  ?               Match 1 or 0 times.
  {n}             Match exactly n times.
  {n,}            Match at least n times.
  {,n}            Match at most n times.
  {x,y}           Match at least x times, but no more than y times.
  *?              Match 0 or more times, but as few times as possible.
  +?              Match 1 or more times, but as few times as possible.
  ??              Match 0 or 1 times, but as few times as possible.
  {n,}?           Match at least n times, but as few times as possible.
  {x,y}?          Match at least x times, no more than y times, and as few times as possible.

Ruby replacement sequences
--------------------------
  Sequence        Meaning
  $1, $2, ...     Captured submatches.
  ${name}         Matched text of a named capture group.
  $'              Text before match.
  $&              Text of match.
  $`              Text after match.
  $+              Last parenthesized match.
  $~              Match data. Encapsulates the results of a successful pattern match.
        EOS
      end
      module_function :man
    end
  end
end
