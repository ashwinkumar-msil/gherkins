Feature: SortFeature
  Test Sorting features

    Scenario: Test tab one alphabeticASC sorting feature of the app
        Given I test the initial state of the app
        And I click the "tab1" icon
        Then I see if the value "name 1" exists
        And I click the "filterIcon" icon
        And I click the 'A - Z' icon
        And I click the "Done" icon
        Then I see if the value "name 10" exists

    Scenario: Test tab one alphabeticDSC sorting feature of the app
        Given I test the initial state of the app
        And I click the "tab1" icon
        Then I see if the value "name 1" exists
        And I click the "filterIcon" icon
        And I click the 'Z - A' icon
        And I click the "Done" icon
        Then I see if the value "name 9" exists

    Scenario: Test tab one numericASC sorting feature of the app
        Given I test the initial state of the app
        And I click the "tab1" icon
        Then I see if the value "name 1" exists
        And I click the "filterIcon" icon
        And I click the '0 - 9' icon
        And I click the "Done" icon
        Then I see if the value "name 1" exists

    Scenario: Test tab one numericDSC sorting feature of the app
        Given I test the initial state of the app
        And I click the "tab1" icon
        Then I see if the value "name 1" exists
        And I click the "filterIcon" icon
        And I click the '9 - 0' icon
        And I click the "Done" icon
        Then I see if the value "name 25" exists

   

