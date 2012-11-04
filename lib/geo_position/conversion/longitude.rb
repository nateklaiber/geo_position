module GeoPosition
  module Conversion
    class Longitude
      BOUNDS = (-180.0..180.0)

      def initialize(longitude)
        raise GeoPosition::Error::InvalidFloatError.new("Arguments could not be coerced to a float") unless valid_float?(longitude)
        raise GeoPosition::Error::InvalidLongitudeError.new("Latitde must be between -180 and 180 degrees: %s provided" % [longitude]) unless within_bounds?(longitude)

        @longitude = longitude.to_f

        @degrees = 0
        @minutes = 0
        @seconds = 0

        convert!
      end

      def degrees
        @degrees
      end

      def minutes
        @minutes
      end

      def seconds
        @seconds
      end

      def direction
        determine_direction
      end

      def to_s
        "%s deg %s' %s\" %s" % [self.degrees, self.minutes, self.seconds, self.direction]
      end

      private
      def within_bounds?(lat)
        BOUNDS.include?(lat.to_f)
      end

      def valid_float?(lat)
        lat.respond_to?(:to_f)
      end

      def convert!
        decimal = @longitude.abs
        @degrees = decimal.floor

        initial_seconds = (decimal - @degrees) * 3600
        @minutes = initial_seconds.floor / 60
        @seconds = (initial_seconds - (@minutes * 60)).floor
      end

      def determine_direction
        if @longitude < 0 then 'W' else 'E' end
      end
    end
  end
end
