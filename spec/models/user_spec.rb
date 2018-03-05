require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :example do
      @user = User.create(name:'name', email:'testing@email.com', password:'password', password_confirmation: 'password')
      @user1 = User.create(name:'name', email:'testing@email.com', password:'password', password_confirmation: 'password')
      @user2 = User.create(name:'name', email:'TESTING@email.com', password:'password', password_confirmation: 'password')
    end
    after :example do
      User.destroy_all
    end
    it "throws error if password does not match password_confirmation" do
      @user.password.should == @user.password_confirmation
    end
    it "throw error when email is already taken" do
      expect(@user1.valid?).to eq false
    end
    it "throw error when email is already taken case sensitive" do
      expect(@user2.valid?).to eq false
    end
    it "throws error if name is missing" do
      @user.name = nil
      expect(@user.valid?).to eq false
    end
    it "throws error if password is missing" do
      @user.password = nil
      expect(@user.valid?).to eq false
    end
    it "throws error if password confirmation is missing" do
      @user.password_confirmation = nil
      expect(@user.valid?).to eq false
    end
    it "throws error if email is missing" do
      @user.email = nil
      expect(@user.valid?).to eq false
    end
    it "throws error if password minimum length has not been met" do
      @user.password = '123'
      @user.password_confirmation = '123'
      expect(@user.valid?).to eq false
    end

    before :example do
      @user = User.create(name:'name', email:'testing@email.com', password:'password', password_confirmation: 'password')
      @user1 = User.create(name:'name', email:'testing@email.com', password:'password', password_confirmation: 'password')
      @user2 = User.create(name:'name', email:'TESTING@email.com', password:'password', password_confirmation: 'password')
    end

    describe '.authenticate_with_credentials' do
      it "throws error if credentials are incorrect" do
        authenticate = User.authenticate_with_credentials("testing@email.com", "password")
        expect(authenticate).to_not eq(nil)
      end
      it "allows users to be authenticated with extra spaces" do
        authenticate = User.authenticate_with_credentials("  testing@email.com ", "password")
        expect(authenticate).to_not eq(nil)
      end
      it "allows user to be authenticated no matter the case" do
        authenticate = User.authenticate_with_credentials("TESTING@EMAIL.com", "password")
        expect(authenticate).to_not eq(nil)
      end
    end
  end
end

