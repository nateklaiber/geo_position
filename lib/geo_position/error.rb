module GeoPosition
  module Error
    autoload :InvalidDirectionError,    File.join(File.dirname(__FILE__), 'error/invalid_direction_error')
    autoload :InvalidFloatError,        File.join(File.dirname(__FILE__), 'error/invalid_float_error')
    autoload :InvalidDegreesError,      File.join(File.dirname(__FILE__), 'error/invalid_degrees_error')
  end
end
