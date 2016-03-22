Given(/^I am on the "([^"]*)" page$/) do |arg|
  case page
    when 'home'
      visit '/'
  end
end

And(/^I click on "([^"]*)"$/) do |element|
  click_link_or_button element
end