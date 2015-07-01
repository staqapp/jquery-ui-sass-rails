# STAQ's jquery-ui-sass-rails gem

An attempt at extending [jquery-ui-rails](https://github.com/joliss/jquery-ui-rails) to support SASS.  Inspired by [jquery-ui-sass-rails](https://github.com/jhilden/jquery-ui-sass-rails).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "staqapp-jquery-ui-sass-rails"
```

## Usage

Require the gem in your entry file in lib for use in a Rails::Engine:

```ruby
# lib/my_engine.rb

require "jquery-ui-sass-rails"
```

Import style in your SASS files:

```
/* app/assets/stylesheets/application.css.scss */

@import "jquery-ui/autocomplete.css.scss";
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jquery-ui-sass-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
