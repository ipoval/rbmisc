## Rbmisc

![codeclimate](https://codeclimate.com/github/ipoval/rbmisc.png)
![travis-ci](https://api.travis-ci.org/ipoval/rbmisc.png)

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbmisc'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rbmisc

### Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rbmisc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rbmisc/blob/master/CODE_OF_CONDUCT.md).

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

### Code of Conduct

Everyone interacting in the Rbmisc project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rbmisc/blob/master/CODE_OF_CONDUCT.md).

### Tests

Minitest: https://github.com/seattlerb/minitest
http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html

### Usage

```
puts Rbm::Regex.man
Rbm::Regex.email
Rbm::Regex.url
Rbm::Regex.zip
Rbm::Regex.ipv4 # alternative Resolv::IPv4::Regex
Rbm::Regex.mac_address
Rbm::Regex.hexcode
Rbm::Regex.usd
Rbm::Regex.date_iso_8601 # yyyy-mm-dd
Rbm::Regex.strong_password
Rbm::Regex.negation
```

```
MultiTierPrice.new(last_usage: 250, tiers: { 0..100 => 0.03, 100..200 => 0.05, 200..300 => 0.07 }).base_charge # => 11.5
```

```
Object
#in?
  100.in? [1, 2, 3, 4, 5, 100] # => true

#not functor
  100.not.instance_of? Fixnum  # => false

#and_try functor
  nil.and_try.size             # => nil

#errors_with_message
  begin
    raise 'Timeout socket'
  rescue errors_with_message /socket/
    p 'socket E'
  end
```

```
Integer
#percent_of
  50.percent_of(100)           # => 50.0
```

```
String
#^, #xor
  'rbmisc'.xor 'test'        # => "\u0006\u0010\u0011\r\u0019\f\u0000\u0017"
```

```
ActiveRecord::Base
.validates_url
.validates_email
.validates_image_url
```
