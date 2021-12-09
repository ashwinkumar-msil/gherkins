Feature: TabFeeature
   Test Tab Changing Feature

    Scenarico: Test Tab One Feature of the app
        Given I test the initial state of the app
        And I click the "contact 1" icon
        Then I see if the value "name 1" exists
        And I scroll to end of the list
        Then I see if the value "name 25" exists

    Scenarico: Test Tab One Feature of the app
        Given I test the initial state of the app
        And I click the "Contact 2" icon
        Then I see if the value "name 26" exists
        And I scroll to end of the list
        Then I see if the value "name 50" exists    
    
     Scenarico: Test Tab One Feature of the app
        Given I test the initial state of the app
        And I click the "Contact 3" icon
        Then I see if the value "name 51" exists
        And I scroll to end of the list
        Then I see if the value "name 75" exists    
    
    Scenario: Test tab four feature of the app
        Given I test the initial state of the app
        And I click the "Contact 4" icon
        Then I see if the value "name 76" exists
        And I scroll to end of the list
        Then I see if the value "name 100" exists
