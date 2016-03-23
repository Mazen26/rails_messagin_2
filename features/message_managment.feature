Feature: As a User, in order to use messaging system
  - I Should be able to access my inbox
  - I Should be able to send message
  - I Should be able to receive message

  Scenario: Send a message
    Given I am registered user
    And I am on the "home" page
    And I click on "Inbox"
    Then I should be on the "mailbox" page
    And I click on "Compose"

