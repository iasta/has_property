module HasProperty
  module DataTypes
    module Base

      # A string that is not trimmed (which is the exception, not the rule)
      class UntrimmedString < String

        # Overridden version that does not trim the whitespace
        def adjust_value(value)
          value
        end
      end
    end
  end
end

