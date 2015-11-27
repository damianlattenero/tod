Feature: Rating restrictions

  Background:
    Given user is logged in

  Scenario: Restrict user to vote a proposal only once
    Given a user creates a proposal
    When user votes a proposal positively
    Then voting buttons should be disabled

## Se botón de voto realizado (positivo en este caso) se deshabilita
