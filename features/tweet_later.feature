@javascript
Feature: A user scheduling a tweet
  In order to schedule a tweet for the future
  As a user
  I want delay the publishing of a tweet

  Scenario: A user delaying the publishing of a tweet
    Given the following user exists:
      | name      |
      | bryckbost |
    And I am logged in as "bryckbost"
    And I am tracking twitter traffic

    When I go to the home page
    And I fill in "What's happening?" with "Went for a run. It was an awesome run."
    And I fill in "Publish at" with "6:00 PM"
    And I press "Publish Later"
    And the time is "6:01 PM"
    Then a tweet should be posted with "Get ready to learn about my first pet!"
