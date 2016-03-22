Feature: As a User, in order to use the application
  - I Should be able to sign up for account
  - I Should be able to log in
  - I Should be able to log out

  Scenario: Register a User
    Given I am on the "home" page
#    Then Show me the page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Password"
    And I fill in "Password confirmation" with "Password"
    And I click on "Create"
    Then I should be on the "home" page
    And I should see "Welcome! You have signed up successfully"
