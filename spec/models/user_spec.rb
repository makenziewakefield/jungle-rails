require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a password and password_confirmation' do
      user = User.new(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
      expect(user).to be_valid
    end

    it 'is not valid when password and password_confirmation do not match' do
      user = User.new(email: "test@test.com", password: "password", password_confirmation: "notpassword", first_name: "Test", last_name: "User")
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(email: "test@test.com", first_name: "Test", last_name: "User")
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
      expect(user).to_not be_valid
    end

    it 'is not valid without a first name' do
      user = User.new(email: "test@test.com", password: "password", password_confirmation: "password", last_name: "User")
      expect(user).to_not be_valid
    end

    it 'is not valid without a last name' do
      user = User.new(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Test")
      expect(user).to_not be_valid
    end

    it 'is not valid if the email is not unique (case insensitive)' do
      user1 = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
      user2 = User.new(email: "TEST@test.com", password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
      expect(user2).to_not be_valid
    end

    it 'is not valid if the password is less than the minimum length' do
      user = User.new(email: "test@test.com", password: "short", password_confirmation: "short", first_name: "Test", last_name: "User")
      expect(user).to_not be_valid
    end

    it 'is not valid if the password is less than 6 characters' do
      user = User.new(email: "test@test.com", password: "short", password_confirmation: "short", first_name: "Test", last_name: "User")
      expect(user).to_not be_valid
    end
    
  end
end
