require 'rails_helper'

describe Movie do
  it 'has a valid factory' do
    expect(build :movie).to be_valid
  end

  describe 'validations' do
    it 'is invalid without a name' do
      expect(build :movie, name: nil).to be_invalid
      expect(build :movie, name: '').to be_invalid
    end

    it 'is invalid without an user owning it' do
      expect(build :movie, user: nil).to be_invalid
    end

    it 'is invalid with an invalid year' do
      expect(build :movie, year: -1).to be_invalid
      expect(build :movie, year: 0).to be_invalid
      expect(build :movie, year: 1.3).to be_invalid
    end
  end
end
