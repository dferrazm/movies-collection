require 'rails_helper'

feature 'Movies creation' do
  let(:user) { create :user }

  scenario 'creating a new movie only when signed in' do
    expect(user.movies.count).to eq 0

    visit '/movies/new'

    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(current_path).to eq '/movies/new'
    fill_in 'Name', with: 'Platoon'
    fill_in 'Genre', with: 'Action'
    fill_in 'Year', with: 1986
    fill_in 'Director', with: 'Oliver Stone'
    fill_in 'Description', with: 'Great movie!'
    click_button 'Add to my collection'

    expect(current_path).to eq '/'
    expect(user.movies.count).to eq 1
  end
end
