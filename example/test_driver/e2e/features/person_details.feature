Feature: HomePage
  Person Details page should display Appropriate Details

  Scenario: Details of Persona should be correct
    Given I am on Application
    When I navigate to Persona List
    And I tap on "card-0"
    Then I See "Atmaram" as "name"
    And I See "Blond" as "hair_color"
    And I See "Dark" as "skin_color"
    And I See "Hazel" as "eye_color"


