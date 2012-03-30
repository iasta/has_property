require 'spec_helper'

module HasProperty
  module DataTypes
    module Base

      describe UntrimmedString do

        it_behaves_like 'a valid data type' do
          let(:data_type) { UntrimmedString }
          let(:sample_value) { 'test' }
        end

        it 'trims the string value' do
          s = UntrimmedString.new '  test value123         '
          s.value.should == '  test value123         '
        end
      end
    end
  end
end

