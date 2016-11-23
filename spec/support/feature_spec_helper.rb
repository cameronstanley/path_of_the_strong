def log_in_user(email, password)
  visit login_path
  fill_in 'session[email]', with: email
  fill_in 'session[password]', with: password
  click_button 'Log In'
end
