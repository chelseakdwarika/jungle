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

  end
end