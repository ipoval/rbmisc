# encoding: utf-8

require 'test_helper'

describe Rbm::Regex do
  describe '.email' do
    it 'valid email regexp' do
      _('ip1@ya.ru').must_match Rbm::Regex.email
      _('iv-p1@yandex.ru').must_match Rbm::Regex.email
    end
  end

  describe '.url' do
    it 'valid url regexp' do
      _('http://google.com').must_match Rbm::Regex.url
      _('http://www.google.com').must_match Rbm::Regex.url
      _('https://google.com').must_match Rbm::Regex.url
      _('https://www.google.com').must_match Rbm::Regex.url
      _('http://google.com/').must_match Rbm::Regex.url
      _('http://www.google.com/').must_match Rbm::Regex.url
      _('https://google.com/').must_match Rbm::Regex.url
      _('https://www.google.com/').must_match Rbm::Regex.url
    end
  end

  describe '.zip' do
    it 'valid zip regexp' do
      _('90028').must_match Rbm::Regex.zip
      _('90028-0000').must_match Rbm::Regex.zip
      _('9002').wont_match Rbm::Regex.zip
    end
  end

  describe '.ipv4' do
    it 'valid dotted quad IP address' do
      _('127.0.0.1').must_match Rbm::Regex.ipv4
      _('224.22.5.110').must_match Rbm::Regex.ipv4
      _('127.1').wont_match Rbm::Regex.ipv4
    end
  end

  describe '.mac_address' do
    it 'valid mac address' do
      _('01:23:45:67:89:ab').must_match Rbm::Regex.mac_address
      _('01:23:45').wont_match Rbm::Regex.mac_address
      _('0123456789ab').wont_match Rbm::Regex.mac_address
    end
  end

  describe '.hexcode' do
    it 'valid html hex code' do
      _('#aaa').must_match Rbm::Regex.hexcode
      _('#000AAA').must_match Rbm::Regex.hexcode
      _('fff').wont_match Rbm::Regex.hexcode
      _('#ggg').wont_match Rbm::Regex.hexcode
    end
  end

  describe '.usd' do
    it '.usd' do
      _('$20').must_match Rbm::Regex.usd
      _('$15,000.01').must_match Rbm::Regex.usd
      _('$1.001').wont_match Rbm::Regex.usd
      _('$.99').wont_match Rbm::Regex.usd
    end
  end

  describe '.phone' do
    it 'valid phone number' do
      _('310-293-5555').must_match Rbm::Regex.phone
      _('(310)-293-5555').must_match Rbm::Regex.phone
      _('310.293.5555').must_match Rbm::Regex.phone
    end
  end

  describe '.date_iso_8601' do
    it 'valid ISO 8601 date (yyyy-mm-dd)' do
      _('2013-02-02').must_match Rbm::Regex.date_iso_8601
      _('2013-13-02').wont_match Rbm::Regex.date_iso_8601
    end
  end

  describe '.strong_password' do
    it '6+ letter password w. at least 1 number, 1 letter, 1 symbol' do
      _('foobar').wont_match Rbm::Regex.strong_password
      _('fo0b@r').must_match Rbm::Regex.strong_password
    end
  end

  describe '.negation' do
    it 'does not contain a string in the body' do
      _('stringfoobar').wont_match Rbm::Regex.negation('foo')
      _('stringbar').must_match Rbm::Regex.negation('foo')
    end
  end
end
