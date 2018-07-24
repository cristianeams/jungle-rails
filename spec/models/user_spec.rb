require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is saved succesfully with all valid fields' do
      user = User.create(
        name: 'Juca', 
        email:'juca@juca.com', 
        password: 'doGGo', 
        password_confirmation: 'doGGo'
      )
      expect(user).to be_valid
    end

    it 'should not save if password is not valid' do
      user = User.create(
        name: 'Juca', 
        email:'juca@j.com', 
        password: nil,
        password_confirmation: 'doGGo'
      )
      expect(user.errors.full_messages).to include('Password can\'t be blank')
    end
     
    it 'should not save if name is not valid' do
      user = User.create(
        name: nil, 
        email:'juca@j.com', 
        password: 'doGGo',
        password_confirmation: 'doGGo'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Name can\'t be blank')
    end
    
    it 'should not save if passwords do not match' do
      pass = User.create(
        name: 'Juca', 
        email:'juca@j.com', 
        password: 'doGGo', 
        password_confirmation: '123'
      )
      expect(pass).to_not be_equal(pass.password_confirmation)
    end

    it 'should not save if password_confirmation is not valid' do
      user = User.create(
        name: 'Juca', 
        email:'juca@j.com', 
        password: 'doGGo',
        password_confirmation: nil
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password confirmation can\'t be blank')
    end

    it 'should not save if password is too short' do
      user = User.create(
        name: 'Juca', 
        email:'juca@j.com', 
        password: '12',
        password_confirmation: '12'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
    end

    it 'should not save if email is not unique' do
      @user = User.create(
        name: 'Juca', 
        email:'juca@j.com', 
        password_digest: '12345'
      )
      @user2 = User.create(
        name: 'Juca', 
        email:'juca@J.com', 
        password_digest: '12345'
      )
      expect(@user2).to_not be_valid
    end
  end
end
