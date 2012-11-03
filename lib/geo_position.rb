root = File.expand_path(File.dirname(__FILE__))

# Version
require File.join(root, 'geo_position', 'version')

# Conversions
require File.join(root, 'geo_position', 'conversion')
require File.join(root, 'geo_position', 'conversion', 'dms')

# Parsers
require File.join(root, 'geo_position', 'parser')

module GeoPosition
end
