require 'rails_helper'

feature 'User sign in' do
  scenario 'signing up and accessing the home page for the first time' do
    visit '/'

    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in'

    click_link 'Sign up'

    fill_in 'Email', with: 'john@doe.com'
    fill_in 'Password', with: 'change123'
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match"

    fill_in 'Password', with: 'change123'
    fill_in 'Password confirmation', with: 'change123'
    click_button 'Sign up'

    expect(current_path).to eq '/'
    expect(page).to have_content 'You have signed up successfully'

    click_link 'Sign out'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'You need to sign in'
  end
end
