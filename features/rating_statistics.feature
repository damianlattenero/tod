Feature: Rating statistics

  Background:
    Given user is logged in

  @wip
  Scenario: A positive vote adds 1 to the total positive votes count
    Given a user creates a proposal
    When user votes a proposal positively
    Then should see "1" in "votos positivos"

  @wip
  Scenario: A negative vote adds 1 to the total negative votes count
    Given a user creates a proposal
    When user votes a proposal negatively
    Then should see "1" in "votos negativos"

  @wip
  Scenario: A negative vote adds 1 to the total negative votes count
    Given a user creates a proposal
    And user votes a proposal positively
    When another user votes a proposal negatively
    Then should see "50%" in "porcentaje votos positivos"
