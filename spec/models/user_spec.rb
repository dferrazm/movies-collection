require 'rails_helper'

describe User do
  describe 'validations' do
    it 'is invalid without an email' do
      expect(build :user, email: nil).to_not be_valid
    end

    it 'is invalid with an invalid email' do
      expect(build :user, email: 'd@sd').to_not be_valid
    end

    it 'is invalid with an already registered email' do
      expect(create :user, email: 'john@doe.com').to be_valid
      expect(build :user, email: 'john@doe.com').to_not be_valid
    end

    it 'is invalid without a password' do
      expect(build :user, password: '').to_not be_valid
    end
  end
end
