require 'spec_helper'

module HasProperty
  module DataTypes
    module Base

      describe String do

        context 'when defining a string property' do

          it_behaves_like 'a valid data type' do
            let(:data_type) { String }
            let(:sample_value) { 'test' }
          end

          it 'allows a validation format to be specified' do
            String.should respond_to :validation_format
          end

          it 'allows a minimum length to be specified' do
            String.should respond_to :minimum_length
          end

          it 'allows a maximum length to be specified' do
            String.should respond_to :maximum_length
          end

          it 'trims the string value' do
            s = String.new '  test value123         '
            s.value.should == 'test value123'
          end

        end

        # Testing the validations would be difficult and rather ineffective here,
        # since they require class method overrides and a model to test.
        # Therefore, instead of testing them here, they are tested via StringTestModel.
      end
    end
  end
end

