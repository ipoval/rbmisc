# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Regex do
  describe '::email' do
    specify 'valid email regexp' do
      Rubymisc::Regex.email.should match 'ipoval@ya.ru'
      Rubymisc::Regex.email.should match 'ivan-poval@yandex.ru'
    end
  end
end
