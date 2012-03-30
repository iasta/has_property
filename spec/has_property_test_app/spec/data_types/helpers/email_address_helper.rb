VALID_EMAIL_ADDRESSES = 'test@test.com test-test@test.co.uk TEST_TEST@TEST.ORG test.77%_-@test.mobi'.split(' ')
INVALID_EMAIL_ADDRESSES = 'test test@ test@test test@test.invalid test#$&@test.com'.split(' ')

shared_examples 'a validated e-mail address' do

  it 'accepts valid e-mail addresses' do
    VALID_EMAIL_ADDRESSES.each do |email|
      set_data_type_property email
      object.should be_valid
    end
  end

  it 'rejects values that are not valid e-mail addresses' do
    INVALID_EMAIL_ADDRESSES.each do |email|
      set_data_type_property email
      object.should_not be_valid
    end
  end
end

