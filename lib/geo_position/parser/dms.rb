module GeoPosition
  module Parser
    class Dms
      FORMAT_REGEX = Regexp.new(/^(?<degrees>[\d]+)\s{1}[^\d]*(?<minutes>[\d]+)\s{1}(?<seconds>[\d]+(\.?[\d]+))\s{1}(?<direction>[nNsSeEwW]{1})/)

      def initialize(dms_string)
        sanitize_string!(dms_string)

        raise GeoPosition::Error::InvalidDmsStringError.new('String could not be parsed') unless valid_string?(dms_string)

        @dms_string = dms_string.to_s
      end

      def degrees
        parsed[:degrees].to_i
      end

      def minutes
        parsed[:minutes].to_i
      end

      def seconds
        parsed[:seconds].to_f
      end

      def direction
        parsed[:direction].upcase
      end

      def to_hash
        keys = [:degrees, :minutes, :seconds, :direction]
        keys.inject({}) { |hsh, key| hsh[key] = self.send(key); hsh }
      end

      private
      def valid_string?(str)
        FORMAT_REGEX.match(str.to_s)
      end

      def sanitize_string!(str)
        str.gsub!(/['"]/, '')
      end

      def parsed
        @dms_string.match(FORMAT_REGEX)
      end
    end
  end
end
