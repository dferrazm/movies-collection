require 'rails_helper'

describe Users::MoviesCollection do
  let(:user) { build_stubbed :user }
  let(:matrix) { create :movie, user: user, name: 'Matrix' }
  let(:collection) { described_class.new(user.movies) }

  describe '#add' do
    it 'adds a new movie to the users collection' do
      expect { collection.add(attributes_for :movie) }.to change(user.movies, :count).by(1)
    end

    it 'returns the movie with errors in case of failure' do
      movie = collection.add(attributes_for :movie, name: nil)
      expect(movie.errors).to_not be_empty
    end
  end

  describe '#find' do
    subject(:movie) { collection.find(matrix.id) }

    it 'finds the movie by id and returns it' do
      expect(movie).to eq matrix
    end
  end

  describe '#update_movie' do
    subject(:movie) { collection.update_movie(matrix.id, name: 'Matrix Reloaded') }

    it 'updates the movie with the new params and returns it' do
      expect(movie.name).to eq 'Matrix Reloaded'
    end
  end
end
