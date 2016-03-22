Feature: As a User, in order to use the application
  - I Should be able to sign up for account
  - I Should be able to log in
  - I Should be able to log out

  Scenario: Register a User
    Given I am on the "home" page
#    Then Show me the page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Name" with "Visitor"
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Password"
    And I fill in "Password confirmation" with "Password"
    And I click on "Create"
    Then I should be on the "home" page
    And I should see "Welcome! You have signed up successfully"

  Scenario: Register a User : password not matching
    Given I am on the "home" page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Name" with "Visitor"
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Password"
    And I fill in "Password confirmation" with "notpassword"
    And I click on "Create"
    Then I should be on the "Users" page
    And I should see "Password confirmation doesn't match Password"

  Scenario: Register a User : password less than 8
    Given I am on the "home" page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Name" with "Visitor"
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Pass"
    And I fill in "Password confirmation" with "Pass"
    And I click on "Create"
    Then I should be on the "Users" page
    And I should see "Password is too short (minimum is 8 characters)"

  Scenario: Register a User : without Email
    Given I am on the "home" page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Name" with "Visitor"
    And I fill in "Email" with " "
    And I fill in "Password" with "Password"
    And I fill in "Password confirmation" with "Password"
    And I click on "Create"
    Then I should be on the "Users" page
    And I should see "Email can't be blank"

  Scenario: Register a User : without Name
    Given I am on the "home" page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Name" with " "
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Password"
    And I fill in "Password confirmation" with "Password"
    And I click on "Create"
    Then I should be on the "Users" page
    And I should see "Name can't be blank"

  Scenario: Register a User :  Name longer than 10 Characters
    Given I am on the "home" page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Name" with "NameLonger Than10 "
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Password"
    And I fill in "Password confirmation" with "Password"
    And I click on "Create"
    Then I should be on the "Users" page
    And I should see "Name 10 Characters is the maximum allowed"

  Scenario: Register a User : Email already taken
    Given I am registered user
    And I am on the "home" page
    And I click on "Logout"
    Then I am on the "home" page
    And I click on "Sign up"
    Then I should be on the "Sign up" page
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "12345678"
    And I fill in "Password confirmation" with "12345678"
    And I click on "Create"
    Then I should be on the "Users" page
    And I should see "Email has already been taken"

  Scenario: Logout a User
    Given I am registered user
    And I am on the "home" page
    And I click on "Logout"
    Then I should be on the "home" page
    And I should see "Signed out successfully."

  Scenario: Log in  a User
    Given I am registered user
    And I Logout a User
    And I am on the "home" page
    And I click on "Login"
    Then I should be on the "Sign in" page
    And I fill in "Email" with "user@any.com"
    And I fill in "Password" with "Password"
    And I click on "Log in"
    Then I should be on the "home" page
    And I should see "Signed in successfully."