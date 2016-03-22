Given(/^I am on the "([^"]*)" page$/) do |page|
  case page
    when 'home'
      visit '/'
    when 'Sign up'
      visit '/users/sign_up'
  end
end

And(/^I click on "([^"]*)"$/) do |element|
  click_link_or_button element
end

Then(/^Show me the page$/) do
  save_and_open_page
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  case page
    when 'Sign up'
      expect(current_path).to eq '/users/sign_up'
    when 'Sign in'
      expect(current_path).to eq '/users/sign_in'
    when 'Users'
      expect(current_path).to eq '/users'
    when 'password new'
      expect(current_path).to eq '/users/password/new'
  end
end


And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, value|
  fill_in(element, with: value)
end

And(/^I should see "([^"]*)"$/) do |string|
  expect(page).to have_text string
end

Given(/^I am registered user$/) do
  @current_user = User.create!(name: 'Visitor', email: 'user@any.com',
                               password: 'Password', password_confirmation: 'Password')
  login_as(@current_user, :scope => :user)
end

Given(/^I Logout a User$/) do
  logout
end