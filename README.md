# GeoPosition

A simple utility to allow you to convert DMS (Degrees, Minutes, Seconds)
to a latitude and longitude. The initial driver for this utility was
working on an application that took Geo Position information from EXIF
data. 

## Installation

Add this line to your application's Gemfile:

    gem 'geo_position'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo_position

## Usage

Usage is very simple right now:

```ruby
conversion = GeoPosition::Conversion::Dms.new(12,3,42.2,'w')

conversion.to_s
=> "12 deg 3' 42.2\" W"

conversion.to_f
=> -12.061783333333333
```

The only requirement is that you pass in a valid direction of N, S, E,
or W. Everything else will be coerced to a float.

## Todo

* Add ability to parse from the EXIF string and extract into the
  conversion object
* Add ability to convert from lat/lon to DMS
* Add simple methods in the root object to handle conversions

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
