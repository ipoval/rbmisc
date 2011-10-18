# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Regex do
  describe '::email' do
    specify 'valid email regexp' do
      Rubymisc::Regex.email.should match 'ipoval@ya.ru'
      Rubymisc::Regex.email.should match 'ivan-poval@yandex.ru'
    end
  end

  describe '::url' do
    specify 'valid url regexp' do
      Rubymisc::Regex.url.should match 'http://google.com'
      Rubymisc::Regex.url.should match 'http://www.google.com'
      Rubymisc::Regex.url.should match 'https://google.com'
      Rubymisc::Regex.url.should match 'https://www.google.com'
      Rubymisc::Regex.url.should match 'http://google.com/'
      Rubymisc::Regex.url.should match 'http://www.google.com/'
      Rubymisc::Regex.url.should match 'https://google.com/'
      Rubymisc::Regex.url.should match 'https://www.google.com/'
    end
  end
end
