require 'rails_helper'

RSpec.feature 'User signs up' do

  background do
    visit signup_path
  end

  scenario 'successfully' do
    fill_in 'user[first_name]', with: 'Test'
    fill_in 'user[last_name]', with: 'User'
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'Password'
    fill_in 'user[password_confirmation]', with: 'Password'
    click_button 'Sign Up'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_text('Account successfully created!') 

    user = User.last
    expect(user.first_name).to eq('Test')
    expect(user.last_name).to eq('User')
    expect(user.email).to eq('test@example.com')
    expect(user.authenticate('Password')).to_not eq(false)
  end

end
