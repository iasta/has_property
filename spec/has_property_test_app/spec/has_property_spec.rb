require 'spec_helper'

class HasPropertyTestModel < ActiveRecord::Base
end

describe ActiveRecord::Base do

  context 'the has_property method' do
    it 'exists' do
      HasPropertyTestModel.should respond_to :has_property
    end

    it 'requires a property name and options[:as]' do
      expect { HasPropertyTestModel.has_property }.to raise_error
      expect { HasPropertyTestModel.has_property :value }.to raise_error
      expect { HasPropertyTestModel.has_property :value, {} }.to raise_error
      expect { HasPropertyTestModel.has_property :value, :as => :string_test }.to_not raise_error
    end

    it 'requires a valid data type' do
      expect { HasPropertyTestModel.has_property :value, :as => :not_a_data_type }.to raise_error
    end
  end

  context 'the field on which has_property is defined' do

    context 'when specified on a defined field' do

      before :each do
        HasPropertyTestModel.has_property :value, :as => :string_test
        @model = HasPropertyTestModel.new
      end

      it 'has an accessible field' do
        @model.should respond_to :value
      end

      it 'is nil by default' do
        @model.value.should be_nil
      end

      context 'when setting a value' do

        before :each do
          @value = 'TEST'
          @model.value = @value
        end

        it 'can be set through the property setter' do
          @model.value.to_s.should == @value
        end

        it 'can be set through the attribute' do
          model = HasPropertyTestModel.new :value => @value
          model.value.to_s.should == @value
        end

        it 'has the proper data type' do
          @model.value.class.should == HasProperty::DataTypes::StringTest
        end

        it 'validates according to the data type validations' do
          @model.value = '*'
          @model.should_not be_valid
        end
      end
    end

    context 'when specified on an undefined field' do
      before :each do
        HasPropertyTestModel.has_property :not_a_property, :as => :string_test
      end

      it 'does not raise an error' do
        # happening in the before :each , so it will fail or succeed properly
      end

      it 'has no effect on validations' do
        @model = HasPropertyTestModel.new
        @model.save!
      end
    end
  end
end

