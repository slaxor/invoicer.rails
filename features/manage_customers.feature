Feature: Manage customers
  In order to create a customer
  an existing user
  wants send a post to the customer ressource

  Scenario: create new customer
    Given I am logged in
    When I fill in "Name" with "name 1"
    And I fill in "Number" with "number 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "number 1"

  Scenario: Delete customer
    Given the following customers:
      |name|number|user_id|
      |name 1|number 1|user_id 1|
      |name 2|number 2|user_id 2|
      |name 3|number 3|user_id 3|
      |name 4|number 4|user_id 4|
    When I delete the 3rd customer
    Then I should see the following customers:
      |Name|Number|User|
      |name 1|number 1|user_id 1|
      |name 2|number 2|user_id 2|
      |name 4|number 4|user_id 4|
