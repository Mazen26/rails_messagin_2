def create_visitor
  @visitor ||= { name: 'Visitor', email: 'user@any.com',
                 password: 'Password', password_confirmation: 'Password' }
end

def sign_up
  visit '/users/sign_up'
  fill_in 'user_name', with: @visitor[:name]
  fill_in 'user_email', with: @visitor[:email]
  fill_in 'user_password', with: @visitor[:password]
  fill_in 'user_password_confirmation', with: @visitor[:password_confirmation]
  click_button 'Create'
end

Given(/^I am on the "([^"]*)" page$/) do |page|
  case page
    when 'home'
      visit '/'
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
  end
end


And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, value|
  fill_in(element, with: value)
end

And(/^I should see "([^"]*)"$/) do |string|
  expect(page).to have_text string
end

Given(/^I am registered user$/) do
  create_visitor
  sign_up
end