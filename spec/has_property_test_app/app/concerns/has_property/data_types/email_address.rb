module HasProperty
  module DataTypes
    # Defines an e-mail address class
    class EmailAddress < Base::String

      # Specifies a format against which the value must be validated
      def self.validation_format
        /^[A-Z0-9\.\_\%\-]+@[A-Z0-9\.\-]+\.[A-Z]{2,4}$/i
      end
    end
  end
end

