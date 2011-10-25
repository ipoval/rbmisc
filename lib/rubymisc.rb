# encoding: utf-8

module Rubymisc
  autoload :Regex, 'rubymisc/regex'

  autoload :Object, 'rubymisc/ext/object'
  ::Object.class_eval 'include Rubymisc::Object'
end

require 'rubymisc/assert'
require 'rubymisc/version'
