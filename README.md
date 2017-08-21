# Barite

Ruby on Rails (with RSpec) custom generators.

[![Build Status](https://travis-ci.org/weathare/barite.svg?branch=master)](https://travis-ci.org/weathare/barite)

## Usage

### app/serializers

```bash
$ rails g response NAME
```

### app/*/concerns

```bash
// controllers module
$ rails g concern:controller NAME

// model module
$ rails g concern:model NAME
```

### spec/*/*_spec.rb

inject test code with included modules

```bash
// controller
$ rails g concern:rspec MODULE_NAME --controller CONTROLLER_NAME

// model
$ rails g concern:rspec MODULE_NAME --model MODEL_NAME
```

### rambulance setup

```bash
$ rails g rambulance:setup
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'barite'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install barite
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
