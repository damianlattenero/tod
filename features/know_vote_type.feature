Feature:
  Como usuario registrado
  quiero ver explícitamente el "caracter" de mi voto en la propuesta

  Background:
    Given user is logged in

  Scenario: Know if my vote was positive
    Given a proposal he did not vote yet
    And user votes a proposal positively
    Then "Positive_rating_button" should be bigger than "Negative_rating_button"

  Scenario: know if my vote was negative
    Given a proposal he did not vote yet
    And user votes a proposal negatively
    Then "Negative_rating_button" should be bigger than "Positive_rating_button"

  Scenario: if I did not vote
    Given a proposal he did not vote yet
    Then "Negative_rating_button" should equale "Positive_rating_button"