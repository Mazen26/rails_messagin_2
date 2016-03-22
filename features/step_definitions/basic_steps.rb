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