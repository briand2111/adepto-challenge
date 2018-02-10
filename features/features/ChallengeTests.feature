@ChallengeTests
Feature: Run the Challenge tests

  @ChallengeTest1
  Scenario: ChallengeTest1
    When I login to the Adepto Portal using email "testchallenge@maildrop.cc" and password "TestChallenge1"
    Then the "dashboard" page is displayed
    And I verify that the phone number displayed on the dashboard page is "0434 343 434"
    When I select the "Tools" tab
    Then I verify that the "Software" shown on the Tools tab has "MS Paint"
    And I verify that the "Hardware" shown on the Tools tab has "Mop and Bucket"
    When I click "Sign Out" from the side navigation menu
    Then I am logged out and at the signup page


  @ChallengeTest2
  Scenario: ChallengeTest2
    When I login to the Adepto Portal using email "testchallenge@maildrop.cc" and password "TestChallenge1"
    Then the "dashboard" page is displayed
    When I click "Search" from the side navigation menu
    And perform a search for "specialising"
    Then I verify that "Luke Skywalker" is included in the search results
    When I click "Sign Out" from the side navigation menu
    Then I am logged out and at the signup page