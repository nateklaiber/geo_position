module GeoPosition
  module Error
    autoload :InvalidDirectionError,    File.join(File.dirname(__FILE__), 'error/invalid_direction_error')
    autoload :InvalidFloatError,        File.join(File.dirname(__FILE__), 'error/invalid_float_error')
    autoload :InvalidDegreesError,      File.join(File.dirname(__FILE__), 'error/invalid_degrees_error')
    autoload :InvalidMinutesError,      File.join(File.dirname(__FILE__), 'error/invalid_minutes_error')
    autoload :InvalidSecondsError,      File.join(File.dirname(__FILE__), 'error/invalid_seconds_error')

    autoload :InvalidDmsStringError,    File.join(File.dirname(__FILE__), 'error/invalid_dms_string_error')
    autoload :InvalidLatitudeError,     File.join(File.dirname(__FILE__), 'error/invalid_latitude_error')
    autoload :InvalidLongitudeError,    File.join(File.dirname(__FILE__), 'error/invalid_longitude_error')
  end
end
