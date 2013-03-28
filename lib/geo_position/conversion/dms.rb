module GeoPosition
  module Conversion
    # This is the main class that will perform the conversion from 
    # Degrees, Minutes, and Seconds
    #
    # @example
    #   conversion = GeoPosition::Conversion::Dms.new(12,3,42.2,'w')
    #
    #   conversion.to_s
    #   => 12 deg 3' 42.2" W
    #
    #   conversion.to_f
    #   => -12.061783333333333
    #
    class Dms
      ALLOWED_SECONDS    = (0.0..60.0)
      ALLOWED_DEGREES    = (0.0..180.0)
      ALLOWED_DIRECTIONS = %w( N n E e S s W w )
      MINUTES_CONVERSION = 60
      SECONDS_CONVERSION = 3600

      # Creates a new instance of the DMS conversion object
      #
      # @param degrees [String,Integer]
      # @param minutes [String,Integer]
      # @param seconds [String,Integer]
      # @param direction [String] The direction
      #
      # @return [void]
      def initialize(degrees, minutes, seconds, direction)
        raise GeoPosition::Error::InvalidDirectionError.new("Please provided a direction of N, S, E, or W") unless valid_direction?(direction)
        raise GeoPosition::Error::InvalidFloatError.new("Arguments could not be coerced to a float") unless valid_floats?([degrees, minutes, seconds])
        raise GeoPosition::Error::InvalidDegreesError.new("Degrees must be between 0 and 180. %s was provided" % [degrees]) unless valid_degrees?(degrees)
        raise GeoPosition::Error::InvalidMinutesError.new("Minutes must be between 0 and 60. %s was provided" % [minutes]) unless valid_minutes?(minutes)
        raise GeoPosition::Error::InvalidSecondsError.new("Seconds must be between 0 and 60. %s was provided" % [seconds]) unless valid_seconds?(seconds)

        @degrees = degrees
        @minutes = minutes
        @seconds = seconds

        @direction = direction
      end

      # Returns the coerced degrees
      #
      # @return [Float] Positive float of the provided degrees
      def degrees
        @degrees.to_f.abs
      end

      # Returns the coerced minutes
      #
      # @return [Float]
      def minutes
        @minutes.to_f
      end

      # Returns the coerced seconds
      #
      # @return [Float]
      def seconds
        @seconds.to_f
      end

      # Returns the uppercased direction
      #
      # @return [String] Uppercase direction
      def direction
        @direction.to_s[0,1].upcase
      end

      # Returns the formatted string
      #
      # @return [String]
      def to_s
        "%s deg %s' %s\" %s" % [self.degrees.to_i, self.minutes.to_i, self.seconds, self.direction]
      end

      # Returns the converted DMS to a float for use with latitude/longitude
      #
      # @return [Float]
      def to_f
        convert!
      end

      private
      def valid_direction?(dir)
        ALLOWED_DIRECTIONS.include?(dir[0,1])
      end

      def valid_floats?(collection)
        collection.all? { |arg| arg.respond_to?(:to_f) }
      end

      def valid_degrees?(deg)
        ALLOWED_DEGREES.include?(deg.to_f.abs)
      end

      def valid_minutes?(min)
        ALLOWED_SECONDS.include?(min.to_f.abs)
      end

      def valid_seconds?(sec)
        ALLOWED_SECONDS.include?(sec.to_f.abs)
      end

      def convert!
        result = (self.degrees + ((self.minutes/MINUTES_CONVERSION) + (self.seconds/SECONDS_CONVERSION)))
        if negative? then (result * -1) else result end
      end

      def negative?
        self.direction == 'S' || self.direction == 'W'
      end
    end
  end
end
