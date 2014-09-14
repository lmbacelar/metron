Feature: Instrument Management
  As a      metrologist
  In order  keep record of instruments
  I want to search, create, update, read and destroy instruments

  Scenario: List all instruments when no instruments exist
    Given I have no "Instruments"
    When  I visit the "Instruments" page
    Then  I should see "No instruments found" 
    And   I should see one "New Instrument" link
    
  Scenario: List all instruments when instruments exist
    Given the following "Instruments" exist:
      | reference | description | manufacturer | model | pn | sn | remarks |
      | MUL001    | Multimeter  | Fluke        | 8842A |    | 01 | app:x   |
      | PAQ003    | Calliper    | Mitutoyo     | 55512 |    | 05 |         |
    When  I visit the "Instruments" page
    Then  I should see "Multimeter" before "Fluke"
    And   I should see "Fluke" before "8842A"
    And   I should see "8842A" before "01"
