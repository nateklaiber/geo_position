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
      # Error that is raised if invalid directions are provided
      InvalidDirectionError = Class.new(StandardError)

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
        raise InvalidDirectionError.new("Please provided a direction of N, S, E, or W") unless valid_direction?(direction)

        @degrees = degrees
        @minutes = minutes
        @seconds = seconds

        @direction = direction
      end

      def degrees
        @degrees.to_f
      end

      def minutes
        @minutes.to_f
      end

      def seconds
        @seconds.to_f
      end

      def direction
        @direction.to_s.upcase
      end

      def to_s
        "%s deg %s' %s\" %s" % [self.degrees.to_i, self.minutes.to_i, self.seconds, self.direction]
      end

      def to_f
        convert!
      end

      private
      def valid_direction?(dir)
        ALLOWED_DIRECTIONS.include?(dir[0,1])
      end

      def convert!
        result = (self.degrees + ((self.minutes/MINUTES_CONVERSION) + (self.seconds/SECONDS_CONVERSION)))
        if negative? then -(result) else result end
      end

      def negative?
        self.direction == 'S' || self.direction == 'W'
      end
    end
  end
end
