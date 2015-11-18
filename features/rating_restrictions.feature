Feature: Rating restrictions

  Background:
    Given user is logged in

  Scenario: Restrict user to vote a proposal only once
    Given a user creates a proposal
    When user votes a proposal positively
    Then "Positive rating button" should be disabled

## Se botón de voto realizado (positivo en este caso) se deshabilita

  Scenario: Let user modify its vote on a proposal
    Given a user creates a proposal
    And user votes a proposal positively
    When clicks on "Negative rating button"
    Then only "Positive rating button" should be enabled

## Solo se habilita el botón alternativo al voto realizado (si votó positivo solo queda habilitado solo el negativo, y viceversa)
