require 'spec_helper'

module HasProperty
  module DataTypes
    module Base

      describe Property do

        before :each do
          @value = 'test value'
          @property = Property.new @value
        end

        it_behaves_like 'a valid data type' do
          let(:data_type) { Property }
          let(:sample_value) { 'test' }
        end

        context 'when checking if the property is blank (blank?)' do
          it 'returns true if the value is nil' do
            property = Property.new nil
            property.should be_blank
          end

          it 'returns true if the value is blank' do
            property = Property.new ''
            property.should be_blank
          end

          it 'returns false if the value is not blank' do
            property = Property.new 'a'
            property.should_not be_blank
          end
        end

        context 'when attempting to access undefined methods' do

          it 'does not initially have the method' do
            @property.should_not respond_to :length
          end

          it 'attempts to call the method on the value property' do
            expect { @property.length }.to_not raise_error
          end

          it 'returns the value of the value property method' do
            @property.length.should == @value.length
          end

          it 'fails if the method does not exist in either the base property or the value' do
            expect { @property.this_is_not_a_method }.to raise_error
          end
        end
      end
    end
  end
end

