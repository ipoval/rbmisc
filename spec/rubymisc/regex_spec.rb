# encoding: utf-8

require 'spec_helper'

describe Rbm::Regex do
  describe '.email' do
    specify 'valid email regexp' do
      Rbm::Regex.email.should match 'ipoval@ya.ru'
      Rbm::Regex.email.should match 'ivan-poval@yandex.ru'
    end
  end

  describe '.url' do
    specify 'valid url regexp' do
      Rbm::Regex.url.should match 'http://google.com'
      Rbm::Regex.url.should match 'http://www.google.com'
      Rbm::Regex.url.should match 'https://google.com'
      Rbm::Regex.url.should match 'https://www.google.com'
      Rbm::Regex.url.should match 'http://google.com/'
      Rbm::Regex.url.should match 'http://www.google.com/'
      Rbm::Regex.url.should match 'https://google.com/'
      Rbm::Regex.url.should match 'https://www.google.com/'
    end
  end

  describe '.zip' do
    specify 'valid zip regexp' do
      Rbm::Regex.zip.should match '90028'
      Rbm::Regex.zip.should match '90028-0000'
      Rbm::Regex.zip.should_not match '9002'
    end
  end

  describe '.ipv4' do
    specify 'valid dotted quad IP address' do
      Rbm::Regex.ipv4.should match '127.0.0.1'
      Rbm::Regex.ipv4.should match '224.22.5.110'
      Rbm::Regex.ipv4.should_not match '127.1'
    end
  end

  describe '.mac_address' do
    specify 'valid mac address' do
      Rbm::Regex.mac_address.should match '01:23:45:67:89:ab'
      Rbm::Regex.mac_address.should_not match '01:23:45'
      Rbm::Regex.mac_address.should_not match '0123456789ab'
    end
  end

  describe '.hexcode' do
    specify 'valid html hex code' do
      Rbm::Regex.hexcode.should match '#aaa'
      Rbm::Regex.hexcode.should match '#000AAA'
      Rbm::Regex.hexcode.should_not match 'fff'
      Rbm::Regex.hexcode.should_not match '#ggg'
    end
  end

  describe '.usd' do
    specify '.usd' do
      Rbm::Regex.usd.should match '$20'
      Rbm::Regex.usd.should match '$15,000.01'
      Rbm::Regex.usd.should_not match '$1.001'
      Rbm::Regex.usd.should_not match '$.99'
    end
  end
end
