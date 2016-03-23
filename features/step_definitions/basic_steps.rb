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

Given(/^the following users exists$/) do |table|
  table.hashes.each do |hash|
    User.create(name: hash[:name],
                email: hash[:email],
                password: hash[:password],
                password_confirmation: hash[:password_confirmation],
    )
  end
end

Given(/^the following message is in inboxs$/) do |table|
  @user = User.last
  sender.send_message(@user, 'My message', 'hello there')
  table.hashes.each do |hash|
    User.create(name: hash[:name],
                email: hash[:email],
                password: hash[:password],
                password_confirmation: hash[:password_confirmation],
    )
  end
end


And(/^I select "([^"]*)" as "([^"]*)"$/) do |name, table|
  select name, from: table
end

Given(/^I sent a message$/) do
steps '
    Given I am registered user
    And I am on the "home" page
    And I click on "Inbox"
    Then I should be on the "mailbox" page
    And I click on "Compose"
    Then I should be on the "conversation new" page
    And I select "Mazen" as "conversation_recipients"
    And I fill in "Subject" with "hi"
    And I fill in "conversation_body" with "Hello how are you"
    And I click on "Send Message"
    Then I should see "Your message was successfully sent!"

'
end
