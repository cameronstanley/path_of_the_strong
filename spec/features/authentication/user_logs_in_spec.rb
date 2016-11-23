require 'rails_helper'

RSpec.feature 'User logs in' do

  given!(:user) { create(:user, email: 'test@example.com', password: 'Password', first_name: 'Test', last_name: 'User') }

  background do
    visit login_path
  end

  scenario 'successfully' do
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: 'Password'
    click_button 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_text('Welcome, Test') 
  end

  scenario 'unsuccessfully' do
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: 'Invalid'
    click_button 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_text('Email/password invalid.')
  end

end
