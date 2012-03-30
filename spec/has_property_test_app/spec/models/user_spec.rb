require 'spec_helper'

describe User do

  before :each do
    @user = User.new :username => 'hsimpson', :email => 'homer.simpson@fox.com'
  end

  context 'when defining a user' do

    it 'allows a username to be specified' do
      @user.should respond_to :username
    end

    it 'allows a password to be specified' do
      @user.should respond_to :password
    end

    it 'allows an e-mail address to be specified' do
      @user.should respond_to :email
    end
  end


  context 'when validating a user' do

    it 'saves a valid model' do
      @user.save.should be_true
    end

    context 'username' do
      it 'is required' do
        @user.username = nil
        @user.should_not be_valid
      end

      it 'must be unique' do
        @user.save!
        user = User.create! :username => 'duplicate', :email => 'marge.simpson@fox.com'
        user.username = @user.username
        user.should_not be_valid
      end

      it_behaves_like 'a validated username' do
        let(:object) { @user }
        let(:property) { :username }
      end

    end

    context 'email' do
      it 'is required' do
        @user.email = nil
        @user.should_not be_valid
      end

      it_behaves_like 'a validated e-mail address' do
        let(:object) { @user }
        let(:property) { :email }
      end
    end

  end
end

