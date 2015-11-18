Feature: Rating statistics

  Background:
    Given user is logged in

#  @wip
  Scenario: A positive vote adds 1 to the total positive votes count
    Given a user creates a proposal
    When user votes a proposal positively
    Then should see "1" positive vote

#  @wip
  Scenario: A negative vote adds 1 to the total negative votes count
    Given a user creates a proposal
    When user votes a proposal negatively
    Then should see "1" negative vote

  Scenario: If first votes positively, and after votes negatively, positive votes are 0 and negative votes are 1
    Given a user creates a proposal
    When user votes a proposal positively
    And user votes a proposal negatively
    Then should see "1" negative vote and "0" positive votes

#  @wip
  Scenario: A negative vote adds 1 to the total negative votes count
    Given a user creates a proposal
    And user votes a proposal positively
    When another user votes a proposal negatively
    Then should see "50%" in porcentaje votos positivos
