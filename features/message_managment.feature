Feature: As a User, in order to use messaging system
  - I Should be able to access my inbox
  - I Should be able to send message
  - I Should be able to receive message

  Background:
    Given the following users exists
      | name | email | password | password_confirmation |
      | Mazen | same@any.com | same55555 | same55555 |
      | Thomas | shme@any.com | shme55555 | shme55555 |
      | Rich | saje@any.com | saje55555 | saje55555 |
      | Fat | qwer@any.com | qwer55555 | qwer55555 |

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

  Scenario: view messages list in sent items
    Given I sent a message
    And I am on the "home" page
    And I click on "Inbox"
    Then I should be on the "mailbox" page
    And I click on "Sent"
    Then I should be on the "sent" page
    And I should see "Hello how are you"

  Scenario: Replay message
    Given I sent a message
    And I am on the "home" page
    And I click on "Inbox"
    Then I should be on the "mailbox" page
    And I click on "Sent"
    Then I should be on the "sent" page
    And I click on "View"
    And I fill in "message_body" with "Hi back"
    Then I click on "Reply"
    Then I should see "Hi back"

    Scenario: Trash a message
    Given I sent a message
    Given I am on the "mailbox" page
    And I should see "Hello how are you"
    Then I click on "Move to trash"
    Then I click on "Trash"
    Then I should see "Hello how are you"
