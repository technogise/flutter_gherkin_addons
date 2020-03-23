Feature: HomePage
  Home Page should display Appropriate Personas

  Scenario: List of Personas should be correct
    Given Below Persona exists
      |name   |hair_color |skin_color |eye_color  |
      |Atmaram|Blonde     |Dark       |Hazel      |
      |Keshav |Black      |Fair       |Balck      |
      |Prasad |Black      |Fair       |Black      |
    When I navigate to Persona List
    Then I See following Personas
        | name |
        | Atmaram |
        | Keshav |
        | Prasad |


