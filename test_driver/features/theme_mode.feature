Feature: Theme Mode Test
 I want to check the different theme modes in the app

 Scenario: Dark mode check
  Given I test the initial state of the app
    And I click the "ThemeSelector" icon
   Then I see if the value "Dark Mode" exists
   And I click the "darkMode" icon
  

 Scenario: Light mode check
  Given I test the initial state of the app
    And I click the "ThemeSelector" icon
   Then I see if the value "Light Mode" exists
   And I click the "lightMode" icon
  

 Scenario: System mode check
  Given I test the initial state of the app
    And I click the "ThemeSelector" icon
   Then I see if the value "System Default" exists
   And I click the "systemDefault" icon

  
 