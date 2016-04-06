# kilometer-ruby

This is the official Kilometer.io library for Ruby. This library allows for server-side integration of Kilometer.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kilometer-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kilometer-ruby

## Usage

Typical usage usually looks like this:

```ruby
  require 'kilometer-ruby'
  
  kilometer = Kilometer::EventsAPIClient.new('<<<APP_ID>>>')

  # Transmit an event with certain properties
  kilometer.add_event('<<<USER-ID>>>', 'user_billed', {billed_amount: 100})
  
  # Update a user's properties
  kilometer.update_user_properties('<<<USER-ID>>>', {status: 'active', "name": '<<<JOHN WHITE>>>'})
```

## Documentation

* <a href="https://kilometer.readme.io/" target="_blank">Full API Reference</a>

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kilometer-io/kilometer-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
