module GeoPosition
  module Conversion
    # This is the main class that will convert from latitude into
    # Degrees, Minutes, Seconds, and Direction
    #
    # @example
    #   latitude = "70.4947"
    #
    #   conversion = GeoPosition::Conversion::Latitude.new(latitude)
    #
    #   conversion.to_s
    #   => "70 deg 29' 40\" N"
    #
    class Latitude
      BOUNDS = (-90.0..90.0)

      # Creates a new instance of the Latitude conversion object
      #
      # @param latitude [String,Numeric]
      #
      # @return [void]
      def initialize(latitude)
        raise GeoPosition::Error::InvalidFloatError.new("Arguments could not be coerced to a float") unless valid_float?(latitude)
        raise GeoPosition::Error::InvalidLatitudeError.new("Latitde must be between -90 and 90 degrees: %s provided" % [latitude]) unless within_bounds?(latitude)

        @latitude = latitude.to_f

        @degrees = 0
        @minutes = 0
        @seconds = 0

        convert!
      end

      # Returns the degrees
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
        decimal = @latitude.abs
        @degrees = decimal.floor

        initial_seconds = (decimal - @degrees) * 3600
        @minutes = initial_seconds.floor / 60
        @seconds = (initial_seconds - (@minutes * 60)).floor
      end

      def determine_direction
        if @latitude < 0 then 'S' else 'N' end
      end
    end
  end
end
