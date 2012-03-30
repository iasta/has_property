shared_examples 'a validated username' do

  it 'rejects values less than four characters' do
    set_data_type_property 'a' * 3
    @user.should_not be_valid
  end

  it 'rejects values larger than 20 characters' do
    set_data_type_property 'a' * 21
    @user.should_not be_valid
  end

  it 'accepts values whose length is between 4 and 20 characters' do
    set_data_type_property 'a' * 4
    @user.should be_valid
    set_data_type_property 'a' * 20
    @user.should be_valid
  end

  it 'accepts values containing only alphanumeric characters' do
    ['hsimpson', 'HSimpson', '123hsimpSON', '1h2s3impson4'].each do |username|
      set_data_type_property username
      @user.should be_valid
    end
  end

  it 'accepts values containing a period, hyphen, or underscore' do
    ['.hsimpson', 'H_Simpson', '123_h-s.imp_SON', '-1h2s3i_mpson4-'].each do |username|
      set_data_type_property username
      @user.should be_valid
    end
  end

  it 'rejects values containing any other character' do
    ['!', '>', '@', '$', '%', '*', '&', '/' '?'].each do |c|
      set_data_type_property "h#{c}simpson"
      @user.should_not be_valid
    end
  end

end

