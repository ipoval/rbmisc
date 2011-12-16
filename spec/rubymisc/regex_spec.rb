# encoding: utf-8

require 'spec_helper'

describe Rubymisc::Regex do
  describe '.email' do
    specify 'valid email regexp' do
      Rubymisc::Regex.email.should match 'ipoval@ya.ru'
      Rubymisc::Regex.email.should match 'ivan-poval@yandex.ru'
    end
  end

  describe '.url' do
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

  describe '.zip' do
    specify 'valid zip regexp' do
      Rubymisc::Regex.zip.should match '90028'
      Rubymisc::Regex.zip.should match '90028-0000'
      Rubymisc::Regex.zip.should_not match '9002'
    end
  end

  describe '.ipv4' do
    specify 'valid dotted quad IP address' do
      Rubymisc::Regex.ipv4.should match '127.0.0.1'
      Rubymisc::Regex.ipv4.should match '224.22.5.110'
      Rubymisc::Regex.ipv4.should_not match '127.1'
    end
  end

  describe '.mac_address' do
    specify 'valid mac address' do
      Rubymisc::Regex.mac_address.should match '01:23:45:67:89:ab'
      Rubymisc::Regex.mac_address.should_not match '01:23:45'
      Rubymisc::Regex.mac_address.should_not match '0123456789ab'
    end
  end

  describe '.hexcode' do
    specify 'valid html hex code' do
      Rubymisc::Regex.hexcode.should match '#aaa'
      Rubymisc::Regex.hexcode.should match '#000AAA'
      Rubymisc::Regex.hexcode.should_not match 'fff'
      Rubymisc::Regex.hexcode.should_not match '#ggg'
    end
  end

  describe '.usd' do
    specify '.usd' do
      Rubymisc::Regex.usd.should match '$20'
      Rubymisc::Regex.usd.should match '$15,000.01'
      Rubymisc::Regex.usd.should_not match '$1.001'
      Rubymisc::Regex.usd.should_not match '$.99'
    end
  end
end
