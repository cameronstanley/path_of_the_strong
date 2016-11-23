require 'rails_helper'

RSpec.feature 'User logs out' do

  given!(:user) { create(:user, email: 'test@example.com', password: 'Password') }

  background do
    log_in_user('test@example.com', 'Password')
  end

  scenario 'successfully' do
    expect(current_path).to eq(dashboard_path)
    click_link 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Successfully logged out.')
  end

end
