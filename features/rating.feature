Feature: rating

  Background:
    Given user is logged in
    And proposal detail page

  Scenario: Rate a proposal positively
    When clicks on "Positive rating button"
    Then should see "Gracias por su voto"

  Scenario: Rate a proposal negatively
    When clicks on "Negative rating button"
    Then should see "Gracias por su voto"

  Scenario: Restrict user to vote a proposal only once
    Given user already voted the current proposal
    When clicks on "Positive rating button"
    Then should see "No puede votar una propuesta mas de una vez"
