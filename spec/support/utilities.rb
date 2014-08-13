include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def complete_valid_signup_form
  user = test_user
  fill_in "Name",         with: user[:name]
  fill_in "Email",        with: user[:email]
  fill_in "Password",     with: user[:password]
  fill_in "Confirmation", with: user[:confirmation]
end

def test_user
  {
      name:         'Example User',
      email:        'user@example.com',
      password:     'foobar',
      confirmation: 'foobar'
  }
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end