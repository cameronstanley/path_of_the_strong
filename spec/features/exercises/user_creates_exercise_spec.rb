require 'rails_helper'

RSpec.feature 'User creates exercise' do
  given!(:user) do
    create(
      :user, 
      first_name: 'Will', 
      last_name: 'Barrow', 
      email: 'wbarrow@example.com', 
      password: 'Password'
    ) 
  end
  given!(:workout) { create(:workout, user_id: user.id, name: 'My Workout') }
  given!(:movement) { create(:movement, name: 'Bench Press') }

  background do
    log_in_user('wbarrow@example.com', 'Password')
  end

  scenario 'successfully' do
    expect(current_path).to eq(dashboard_path)
    click_link 'Workouts'

    expect(current_path).to eq(workouts_path)
    click_link 'My Workout'

    expect(current_path).to eq(workout_path(workout))
    click_link 'Edit Workout'
  
    expect(current_path).to eq(edit_workout_path(workout))
    click_button 'New Exercise'
    select 'Bench Press', from: 'exercise[movement_id]' 
    click_button 'Add Exercise'

    expect(current_path).to eq(edit_workout_path(workout))
    expect(page).to have_text('Exercise was successfully created.')

  end
end
