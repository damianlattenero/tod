Feature: Rating statistics

#  @wip
  Scenario: A positive vote adds 1 to the total positive votes count
    Given user is logged in
    And a user creates a proposal
    When user votes a proposal positively and log out
    Then should see "1" positive vote

#  @wip
  Scenario: A negative vote adds 1 to the total negative votes count
    Given user is logged in
    And a user creates a proposal
    When user votes a proposal negatively and log out
    Then should see "1" negative vote

  Scenario: If first votes positively, and after votes negatively, positive votes are 0 and negative votes are 1
    Given user is logged in
    And a user creates a proposal
    When user votes a proposal positively
    And user votes a proposal negatively and log out
    Then should see "1" negative vote and "0" positive votes

#  @wip
  Scenario: A negative vote adds 1 to the total negative votes count
    Given user is logged in
    And a user creates a proposal
    When user votes a proposal positively and log out
    And a user with mail "juan@gmail.com" votes a proposal negatively
    Then should see "50%" in porcentaje votos positivos
