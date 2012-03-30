shared_examples 'a valid data type' do

  before :each do
    @property = data_type.new sample_value
  end

  context 'the value property' do
    it 'exists' do
      @property.should respond_to :value
    end

    it 'can be read' do
      @property.value.should == sample_value
    end

    it 'cannot be written (it must instead be rebuilt according to the requirements of ActiveRecord#composed_of)' do
      expect { @property.value = sample_value }.to raise_error
    end

    it 'is specified upon creation' do
      property = data_type.new sample_value
      property.value.should == sample_value
    end
  end

  context 'when converting to a string (to_s)' do
    it 'returns the string value of the value property' do
      @property.to_s.should == sample_value.to_s
    end
  end
end

