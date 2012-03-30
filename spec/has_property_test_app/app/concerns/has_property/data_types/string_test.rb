module HasProperty
  module DataTypes
    # Defines a string class for testing purposes, so it should contain
    # all functionality exposed by the string base class
    class StringTest < Base::String

      def self.validation_format
        /^[A-Z]+$/
      end

      def self.minimum_length
        4
      end

      def self.maximum_length
        20
      end
    end
  end
end

