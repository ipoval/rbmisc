# encoding: utf-8

module Rubymisc
  autoload :Object,      'rubymisc/ext/object'
  autoload :Integer,     'rubymisc/ext/integer'
  autoload :Float,       'rubymisc/ext/float'

  autoload :Regex,       'rubymisc/regex'
  autoload :Exceptional, 'rubymisc/exceptional'
end

require 'rubymisc/version'
