require 'has_property/data_types/base/property'
require 'has_property/data_types/base/string'

module HasProperty
  module ClassMethods

    # Public method to define a property as a particular data type.
    # Specify the property name (symbol) as the first parameter.
    # The second parameter is an options hash supporting the following parameters:
    # :as -- Symbol that specifies the data type to use
    def has_property(name, options)
      data_type = get_has_property_data_type options[:as]
      initialize_has_property_composed_of name, data_type
      data_type.build_model_validators self, name
    end

    protected

      # Initializes the call to composed_of(), which uses internal Rails functionality
      # to associate a field with a custom data type
      def initialize_has_property_composed_of(name, data_type)
        composed_of name, :class_name => data_type.name,
          # map the property name to the "value" property of the data type class
          :mapping => [name, :value],
          # as far as this is concerned, nulls are allowed --
          #the model can do a separate validates_presence_of() if desired
          :allow_nil => true,
          # create the data type instance automatically from the primitive value
          :converter => Proc.new { |value| data_type.new(value) }
      end

      # Returns the data type class from the given symbol / name.
      # This function assumes that all data classes are within the HasProperty::DataTypes namespace.
      def get_has_property_data_type(name)
        "HasProperty::DataTypes::#{name.to_s.camelize}".constantize
      end
  end
end
