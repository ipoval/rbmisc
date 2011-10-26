# encoding: utf-8

module Rubymisc
  autoload :Regex, 'rubymisc/regex'

  autoload :Object, 'rubymisc/ext/object'
  ::Object.class_eval 'include Rubymisc::Object'

  autoload :Integer, 'rubymisc/ext/integer'
  ::Integer.class_eval 'include Rubymisc::Integer'

  autoload :Float, 'rubymisc/ext/float'
  ::Float.class_eval 'include Rubymisc::Float'
end

require 'rubymisc/assert'
require 'rubymisc/version'
