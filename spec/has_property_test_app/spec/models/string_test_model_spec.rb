require 'spec_helper'

describe StringTestModel do

  before :each do
    @model = StringTestModel.new :value => 'TEST'
    @data_type = @model.value.class
  end

  context 'when defining the model' do
    it 'has a value property to test the string data type' do
      @model.should respond_to :value
    end
  end

  context 'when validating the string data type' do

    it 'allows nil values' do
      @model.value = nil
      @model.should be_valid
    end

    it 'allows blank values' do
      @model.value = ''
      @model.should be_valid
    end

    it 'trims the string' do
      @model.value = '   abc      '
      @model.value.should == 'abc'
    end

    context 'when validating the format' do
      it 'allows values that match the validation format' do
        ['TEST', 'TESTING', 'FOOBAR'].each do |value|
          @model.value = value
          @model.should be_valid
        end
      end

      it 'rejects values that do not match the validation format' do
        ['TEST1', 'test', 'Test', 'TEST*()'].each do |value|
          @model.value = value
          @model.should_not be_valid
        end
      end
    end

    context 'when validating the minimum length' do
      it 'rejects values less than the minimum length' do
        @model.value = 'A' * (@data_type.minimum_length - 1)
        @model.should_not be_valid
      end

      it 'accepts values equal to the minimum length' do
        @model.value = 'A' * @data_type.minimum_length
        @model.should be_valid
      end

      it 'accepts values more than the minimum length' do
        @model.value = 'A' * (@data_type.minimum_length + 1)
        @model.should be_valid
      end
    end

    context 'when validating the maximum length' do
      it 'rejects values greater than the maximum length' do
        @model.value = 'A' * (@data_type.maximum_length + 1)
        @model.should_not be_valid
      end

      it 'accepts values equal to the maximum length' do
        @model.value = 'A' * @data_type.maximum_length
        @model.should be_valid
      end

      it 'accepts values less than the maximum length' do
        @model.value = 'A' * (@data_type.maximum_length - 1)
        @model.should be_valid
      end
    end

  end

end

