Feature: HomePage
  Person Details page should display Appropriate Details

  Scenario: Details of Persona should be correct
    Given I am on Application
    When I navigate to Persona List
    And I tap on "card-0"
    Then I See "Luke Skywalker" as "name"
    And I See "blond" as "hair_color"
    And I See "fair" as "skin_color"
    And I See "blue" as "eye_color"


