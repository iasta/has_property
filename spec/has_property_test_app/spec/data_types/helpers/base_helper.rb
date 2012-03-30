# Sets the property of the object to the specified value --
# This is helpful in the data type spec helpers since the object and property name will vary
def set_data_type_property(value)
  object.send((property.to_s + '='), value)
end

