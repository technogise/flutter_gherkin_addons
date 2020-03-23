Feature: HomePage
  Person Details page should display Appropriate Details

  Scenario: Persona Details should be correct
    Given Below Persona exists
      |name   |hair_color |skin_color |eye_color  |
      |Atmaram|Blonde     |Dark       |Hazel      |

    When I navigate to Persona List
    And I tap on "card-0"
    Then I See "Atmaram" as "name"
    And I See "Blonde" as "hair_color"
    And I See "Dark" as "skin_color"
    And I See "Hazel" as "eye_color"


