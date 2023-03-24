require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create a new user if you enter an name, email, password & password confirmation' do
      @user = User.create(
        name: 'Severus Snape',
        email: 'snape@hogwarts.com',
        password: 'potions666',
        password_confirmation: 'potions666')
      @user.valid?
      expect(@user.errors.full_messages.size).to eq(0)
    end

    it 'should throw an error if password & password confirmation do not match' do
      @user = User.create(
        email: 'snape@hogwarts.com',
        name:'Severus Snape',
        password: 'potions666',
        password_confirmation: 'slytherin')
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should throw an error if email already exists' do
      @user1 = User.create(email: 'snape@hogwarts.com', name: 'Severus Snape', password: 'potions666', password_confirmation: 'potions666')
      @user2 = User.create(email: 'snape@hogwarts.com', name: 'Harry Potter', password: 'potions666', password_confirmation: 'potions666')
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should throw an error if password is less than 8 characters' do
      @user = User.create(password: 'potion')
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should not authenticate with an incorrect password' do
      @new_user = User.create(email: 'snape@hogwarts.com', name: 'Severus Snape', password: 'potions666', password_confirmation: 'potions666')
      @existing_user = User.find_by_email('snape@hogwarts.com')
      expect(User.authenticate_with_credentials('snape@hogwarts.com', 'slytherin')).to eq(nil)
    end

    it 'should authenticate with correct credentials' do
      @new_user = User.create(email: 'snape@hogwarts.com', name: 'Severus Snape', password: 'potions666', password_confirmation: 'potions666')
      @existing_user = User.find_by_email('snape@hogwarts.com')
      expect(User.authenticate_with_credentials('snape@hogwarts.com', 'potions666')).to eq(@existing_user)
    end

    it 'should still authenticate email in lower or uppercase text' do
      @new_user = User.create(email: 'snape@hogwarts.com', name: 'Severus Snape', password: 'potions666', password_confirmation: 'potions666')
      @existing_user = User.find_by_email('snape@hogwarts.com')
      expect(User.authenticate_with_credentials('SNAPE@hogwarts.com', 'potions666')).to eq(@existing_user)
    end

  end
end