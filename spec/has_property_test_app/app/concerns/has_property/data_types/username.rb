module HasProperty
  module DataTypes
    # Defines a username class
    class Username < Base::String

      def self.validation_format
        /^[A-Za-z0-9\.\_\-]+$/
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

