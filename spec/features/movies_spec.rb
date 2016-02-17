require 'rails_helper'

feature 'Movies creation' do
  include FeaturesHelper

  let(:user) { create :user }

  before { sign_in(user) }

  scenario 'creating a new movie' do
    expect(user.movies.count).to eq 0

    visit '/'

    fill_in 'movie_name', with: 'Platoon'
    click_button 'Add movie'

    fill_in 'Genre', with: 'Action'
    fill_in 'Year', with: 1986
    fill_in 'Director', with: 'Oliver Stone'
    fill_in 'Description', with: 'Great movie!'
    click_button 'Done'

    expect(current_path).to eq '/'
    expect(user.movies.count).to eq 1
  end
end
