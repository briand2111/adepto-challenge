@Dev

  Feature: Dev feature

    @Dev0
      Scenario: Get working
        When I run a step

    @Dev1
    Scenario Outline: Testing test 1
      When I login to the Adepto Portal using email "testchallenge@maildrop.cc" and password "TestChallenge1"
      Then the "dashboard" page is displayed
      And I verify that the phone number displayed on the dashboard page is "0434 343 434"
      When I select the "Tools" tab
      Then I verify that the "<Section>" shown on the Tools tab has "<Entry>"
      When I click "Sign Out" from the side navigation menu
      Then I am logged out and at the signup page

      Examples:
        | Section           | Entry                        | Description  |
        | Software          | MS Paint                     | Current test |
        | Hardware          | Mop and Bucket               | Current test |
        | Workwear          | Non-Exist Item               | Should fail  |
        | Non-Exist Section | Non-Exist Item               | Should fail  |



    @Dev2
    Scenario Outline: Testing test 2
      When I login to the Adepto Portal using email "testchallenge@maildrop.cc" and password "TestChallenge1"
      Then the "dashboard" page is displayed
      When I click "Search" from the side navigation menu
      And perform a search for "specialising"
      Then I verify that "<SearchName>" is included in the search results
      When I click "Sign Out" from the side navigation menu
      Then I am logged out and at the signup page

      Examples:
      |SearchName      | Description                        |
      | Luke Skywalker | Current test                       |
      | Non-Exist Name | Should fail                        |
      | Bob Ganes      | Should be found on the second page |
