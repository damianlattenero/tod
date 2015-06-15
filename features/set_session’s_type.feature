Feature: Set session’s type

  Background:
    Given an author user

  Scenario: author selects presentation for his proposal
    When an author creates a proposal
    And   he selects "Presentacion" as sessions type
    And   submits
    Then  sessions type for proposal should be "Presentacion"

  Scenario: author selects "taller" for his proposal
    And   he selects "Taller" as sessions type
    And   submits
    Then  sessions type for proposal should be "Taller"