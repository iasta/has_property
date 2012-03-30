require 'spec_helper'

describe Contact do

  before :each do
    @attr = { :first_name => 'Ned', :last_name => 'Flanders',  :email => 'ned.flanders@fox.com' }
    @contact = Contact.new @attr
  end

  context 'when defining a contact' do

    it 'allows a first name to be specified' do
      @contact.should respond_to :first_name
    end

    it 'allows a last name to be specified' do
      @contact.should respond_to :last_name
    end

    it 'allows an e-mail address to be specified' do
      @contact.should respond_to :email
    end

    it 'allows a phone number to be specified' do
      @contact.should respond_to :phone
    end
  end


  context 'when validating a contact' do

    it 'saves a valid model' do
      @contact.save.should be_true
    end

    context 'email' do
      it_behaves_like 'a validated e-mail address' do
        let(:object) { @contact }
        let(:property) { :email }
      end

      it 'is required' do
        @contact.email = nil
        @contact.should_not be_valid
      end

      it 'must be unique' do
        @contact.save!
        contact = Contact.create! @attr.merge(:email => 'duplicate.ned.flanders@fox.com')
        contact.email = @contact.email
        contact.should_not be_valid
      end
    end

  end
end

