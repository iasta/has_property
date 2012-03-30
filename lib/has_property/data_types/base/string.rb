module HasProperty
  module DataTypes
    module Base

      # Defines a base data type that contains a single string value.
      # Descendants can be built to consolidate all functionality for a type of string, e.g. an e-mail address.
      class String < ::String

        # called within the constructor -- initializes the value
        def initialize(value)
          super(adjust_value value)
        end

        # Trims the whitespace of all strings
        def adjust_value(value)
          value.to_s.strip
        end

        # Required for all data types -- returns the actual string value
        def value
          to_s
        end

        # class function to create validators on the model class for the specified property
        def self.build_model_validators(model_class, property_name)
          build_format_validator model_class, property_name
          build_length_validator model_class, property_name
        end

        # builds the format validator if validation_format() returns a result
        def self.build_format_validator(model_class, property_name)
          if validation_format
            model_class.validates_format_of property_name, :with => validation_format,
              :allow_nil => true, :allow_blank => true
          end
        end

        # builds the length validator if minimum_length() or maximum_length() returns a result
        def self.build_length_validator(model_class, property_name)
          return unless minimum_length || maximum_length
          params = { :allow_nil => true, :allow_blank => true }
          params[:minimum] = minimum_length if minimum_length
          params[:maximum] = maximum_length if maximum_length
          model_class.validates_length_of property_name, params
        end

        # returns the regex used to validate the format of the string value --
        # if not specified (default in this base class), the format is not validated
        def self.validation_format
          nil
        end

        # returns the minimum length of the string value --
        # if not specified (default in this base class), the minimum length is not validated
        def self.minimum_length
          nil
        end

        # returns the maximum length of the string value --
        # if not specified (default in this base class), the maximum length is not validated
        def self.maximum_length
          nil
        end
      end
    end
  end
end

