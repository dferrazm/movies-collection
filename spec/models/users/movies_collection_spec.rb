require 'rails_helper'

describe Users::MoviesCollection do
  let(:user) { create :user }
  let(:collection) { described_class.new(user) }

  describe '#add' do
    it 'adds a new movie to the users collection' do
      expect { collection.add(attributes_for :movie) }.to change(user.movies, :count).by(1)
    end

    it 'returns the movie with errors in case of failure' do
      movie = collection.add(attributes_for :movie, name: nil)
      expect(movie.errors).to_not be_empty
    end
  end
end
