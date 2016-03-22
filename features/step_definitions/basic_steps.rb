Given(/^I am on the "([^"]*)" page$/) do |arg|
  case page
    when 'home'
      visit '/'
  end
end

