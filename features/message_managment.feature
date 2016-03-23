Feature: As a User, in order to use messaging system
  - I Should be able to access my inbox
  - I Should be able to send message
  - I Should be able to receive message

  Background:
    Given the following users exists
      | name   | email        | password  | password_confirmation |
      | Mazen  | same@any.com | same55555 | same55555             |
      | Thomas | shme@any.com | shme55555 | shme55555             |
      | Rich   | saje@any.com | saje55555 | saje55555             |
      | Fat    | qwer@any.com | qwer55555 | qwer55555             |

  Scenario: Send a message
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



  Scenario: view message in sent items
    Given I sent a message
    And I am on the "home" page
    And I click on "Inbox"
    Then I should be on the "mailbox" page
    And I click on "sent"
    Then I should be on the "conversation sent" page

