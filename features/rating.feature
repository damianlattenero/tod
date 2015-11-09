Feature: rating

  Background:
    Given user is logged in
    And proposal detail page

  @wip
  Scenario: Rate a proposal positively
    When clicks on "Positive rating button"
    Then should see "Gracias por tu voto"

  @wip
  Scenario: Rate a proposal negatively
    When clicks on "Negative rating button"
    Then should see "Gracias por tu voto"

