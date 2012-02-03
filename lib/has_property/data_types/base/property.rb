module HasProperty
  module DataTypes
    module Base

      # Defines a base data type that contains a single value.
      # Descendants should be built for each data type, then for each property type (e.g. e-mail address, currency)
      class Property
        # the value property contains the actual primitive value
        attr_reader :value

        # called within the constructor -- initializes the value
        def initialize(value)
          @value = value
        end

        # outputs the value's string conversion (useful particularly within views)
        def to_s
          @value.to_s
        end

        # delegates the blank? function to the primitive value
        def blank?
          @value.blank?
        end

        # delegates all methods missing in this class to the primitive value
        def method_missing(meth, *args, &block)
          # if the method exists on the value, create a method on this class
          # to call the value's method so that method_missing only has to be
          # called once per method.
          if @value.respond_to? meth
            self.class.send :define_method, meth do |*args, &block|
              @value.send(meth, *args, &block)
            end
            self.send(meth, *args, &block)
          else
            super
          end
        end

        # class function to create validators on the model class for the specified property
        def self.build_model_validators(model_class, property_name)
          # do nothing in the base class
        end
      end

    end
  end
end

