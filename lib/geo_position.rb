root = File.expand_path(File.dirname(__FILE__))

# Version
require File.join(root, 'geo_position', 'version')

# Errors
require File.join(root, 'geo_position', 'error')

# Conversions
require File.join(root, 'geo_position', 'conversion')
require File.join(root, 'geo_position', 'conversion', 'dms')
require File.join(root, 'geo_position', 'conversion', 'latitude')
require File.join(root, 'geo_position', 'conversion', 'longitude')

# Parsers
require File.join(root, 'geo_position', 'parser')
require File.join(root, 'geo_position', 'parser', 'dms')

module GeoPosition
  def self.from_dms(degrees, minutes, seconds, direction)
    conversion = GeoPosition::Conversion::Dms.new(degrees, minutes, seconds, direction)
    conversion.to_f
  end

  def self.from_latitude(latitude)
    conversion = GeoPosition::Conversion::Latitude.new(latitude)
    conversion.to_s
  end

  def self.from_longitude(longitude)
    conversion = GeoPosition::Conversion::Longitude.new(longitude)
    conversion.to_s
  end
end
