# GeoPosition

A simple utility to allow you to convert DMS (Degrees, Minutes, Seconds)
to a latitude and longitude. The initial driver for this utility was
working on an application that took Geo Position information from EXIF
data and converted it to lat/lon for use in both the database storage
and querying Google's API.

## Installation

Add this line to your application's Gemfile:

    gem 'geo_position'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo_position

## Usage

I prefer smaller components that can be put together in different ways.

Usage is simple:

```ruby
# This can be any positive number between 0 and 360. It will be coerced
# to a float and absoluted.
degrees = 12

# Minutes
minutes = 3

# Seconds
seconds = 42.42

# Direction must be one of N, S, E, or W
direction = 'w'

conversion = GeoPosition::Conversion::Dms.new(degrees, minutes, seconds,
direction)

conversion.to_s
=> "12 deg 3' 42.42\" W"

conversion.to_f
=> -12.061783333333333
```

## Todo

* Add ability to parse from the EXIF string and extract into the
  conversion object
* Add ability to convert from lat/lon to DMS
* Add simple methods in the root object to handle conversions
* Add a command line component

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
