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
    And   I should see one "New Instrument" link

  Scenario: Access the new Instrument form
    When  I visit the "Instruments" page
    And   I follow "New Instrument"
    Then  I should be on the new "Instrument" page
    And   I should see "Reference"
    And   I should see "Description"
    And   I should see "Manufacturer"
    And   I should see "Model"
    And   I should see "Serial Number"
    And   I should see "Part Number"
    And   I should see "Remarks"

  Scenario: Create new Instrument with valid data
    Given I am on the new "Instrument" page
    When  I fill in "Reference" with "MUL002"
    And   I fill in "Description" with "Digital Multimeter"
    And   I fill in "Manufacturer" with "Agilent"
    And   I fill in "Model" with "3458A"
    And   I fill in "Serial Number" with "2500A33252"
    And   I press "Create"
    Then  I should be on the page of "Instrument" with "Reference" "MUL002"
    And   I should see "MUL002"
    And   I should see "Digital Multimeter"
    And   I should see "Agilent"
    And   I should see "3458A"
    And   I should see "2500A33252"
    And   I should see "Instrument was successfully created"

  Scenario: Create new Instrument with invalid data
    Given I am on the new "Instrument" page
    And   I press "Create"
    Then  I should see "Please review the problems below"
    And   I should see /Reference\s*can't be blank/
    And   I should see /Description\s*can't be blank/
    And   I should not see "Instrument was successfully created"

  Scenario: Edit existing Instrument
    Given the following "Instruments" exist:
      | reference | description | manufacturer | model | pn | sn | remarks |
      | MUL001    | Multimeter  | Fluke        | 8842A |    | 01 | app:x   |
    When I visit the "Instruments" page
    And  I follow "Edit"
    And  I fill in "Description" with "Digital Multimeter"
    And  I press "Update"
    Then I should see "Instrument was successfully updated"
    And I should see "Digital Multimeter"
    And I should have 1 "Instrument"

  Scenario: Delete ITS-90 Function
    Given the following "Instruments" exist:
      | reference | description | manufacturer | model | pn | sn | remarks |
      | MUL001    | Multimeter  | Fluke        | 8842A |    | 01 | app:x   |
    When  I visit the "Instruments" page
    And   I follow "Destroy"
    Then  I should be on the "Instruments" page
    And   I should see "Instrument was successfully destroyed"
    And   I should not see "MUL001"
