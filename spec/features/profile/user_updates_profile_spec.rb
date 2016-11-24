require 'rails_helper'

RSpec.feature 'User updates profile' do

  given!(:user) { create(:user, first_name: 'Will', last_name: 'Barrow', email: 'wbarrow@example.com', password: 'Password') }

  background do
    log_in_user('wbarrow@example.com', 'Password')
  end

  scenario 'successfully' do
    expect(current_path).to eq(dashboard_path)
    click_link 'Will'

    expect(current_path).to eq(profile_path)
    fill_in 'profile[first_name]', with: 'Max'
    fill_in 'profile[last_name]', with: 'Conversion'
    fill_in 'profile[email]', with: 'mconversion@example.com'
    fill_in 'profile[password]', with: 'UpdatedPassword'
    fill_in 'profile[password_confirmation]', with: 'UpdatedPassword'
    click_button 'Update Profile'

    expect(current_path).to eq(profile_path)
    expect(page).to have_text('Profile was successfully updated.')
    
    updated_user = User.find(user.id)

    expect(updated_user.first_name).to eq('Max')
    expect(updated_user.last_name).to eq('Conversion')
    expect(updated_user.email).to eq('mconversion@example.com')
    expect(updated_user.authenticate('UpdatedPassword')).to_not eq(false)
  end

end
