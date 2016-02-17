require 'rails_helper'

feature 'Movies creation' do
  let(:user) { create :user }

  before { login_as(user, scope: :user) }

  scenario 'creating a new movie', js: true do
    expect(user.movies.count).to eq 0

    visit '/'

    expect(page).to_not have_content 'Platoon'

    fill_in 'movie_name', with: 'Platoon'
    click_button 'Add movie'

    fill_in 'Genre', with: 'Action'
    fill_in 'Year', with: 1986
    fill_in 'Director', with: 'Oliver Stone'
    fill_in 'Description', with: 'Great movie!'
    click_button 'Done'

    expect(current_path).to eq '/'
    expect(page).to have_content 'Platoon'

    expect(user.movies.count).to eq 1
  end
end
