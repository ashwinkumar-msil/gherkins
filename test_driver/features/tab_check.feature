Feature: TabSwitchFeature
  Test TabSwitch features

    Scenario: Test tab one feature of the app
        Given I test the initial state of the app
        When I click the "tab1" icon
        Then I see if the value "name 1" exists
        And I scroll to end of the list
        Then I see if the value "name 25" exists
        And I scroll to up of the list
         When I click the "tab2" icon
         Then I see if the value "name 26" exists
         And I scroll to end of the list
         Then I see if the value "name 50" exists
         And I scroll to up of the list
         When I click the "tab3" icon
         When I see if the value "name 51" exists
         And I scroll to end of the list
         Then I see if the value "name 75" exists
         And I scroll to up of the list
         When I click the "tab4" icon
         Then I see if the value "name 76" exists
         And I scroll to end of the list
         Then I see if the value "name 100" exists
         And I scroll to up of the list

        
      

      