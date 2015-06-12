Feature: Set session’s type

  Background:
    Given an author user

  Scenario: author selects presentation for his proposal
    When an author creates a proposal
    And    he selects "presentacion" as session’s type
    And    submits
    Then  session’s type for proposal should be "presentacion"

  Scenario: author selects "taller" for his proposal
    And    he selects "taller" as session’s type
    And    submits
    Then  session’s type for proposal should be "taller"