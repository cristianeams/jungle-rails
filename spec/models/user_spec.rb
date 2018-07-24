require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) { User.new(name: 'Juca', email:'juca@j.com', password: 'doGGo', password_confirmation: 'doGGo') }
    let(:user2) { User.new(name: 'Juca', email:'juca@j.com', password: 'doGGo', password_confirmation: 'doGGo') }

    it 'is saved succesfully with all valid fields' do
      expect(user).to be_valid
    end

    it 'should not save if password is not valid' do
      user.password = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password can\'t be blank')
    end
     
    it 'should not save if name is not valid' do
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Name can\'t be blank')
    end
    
    it 'should not save if passwords do not match' do
      user.password_confirmation = '123'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end

    it 'should not save if password_confirmation is not valid' do
      user.password_confirmation = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password confirmation can\'t be blank')
    end

    it 'should not save if password is too short' do
      user.password = 'yo'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
    end

    it 'should not save if email is not valid' do
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'should not save if email is not unique and written in lowercase/uppercase' do
      user.save
      user2.email = 'JUCA@J.com'
      user2.save
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end

  end
end
