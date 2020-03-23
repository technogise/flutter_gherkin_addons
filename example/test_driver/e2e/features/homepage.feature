Feature: HomePage
  Home Page should display Appropriate Personas

  Scenario: List of Personas should be correct
    Given I am on Application
    When I navigate to Persona List
    Then I See following Personas
        | name |
        | Luke Skywalker |
        | C-3PO |
        | R2-D2 |


