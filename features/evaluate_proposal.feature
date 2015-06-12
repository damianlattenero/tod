Feature: Evaluate a proposal

Background:
  Given a revisor user
  And   and proposal he did not evaluate yet

Scenario: revisor evaluates a proposal with opinion "Aceptación Debil"
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on Evaluate a proposal
  And  evaluates its with opinion "Aceptación Debil"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Aceptacion Debil" should be displayed

Scenario: revisor evaluates a proposal with opinion "Rechazo Debil"
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on Evaluate a proposal
  And  evaluates its with opinion "Rechazo Débil"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Rechazo Debil" should be displayed

Scenario: revisor evaluates a proposal with opinion "Aceptación Fuerte"
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on Evaluate a proposal
  And  evaluates its with opinion "Aceptación Fuerte"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Aceptacion Fuerte" should be displayed

Scenario: revisor evaluates a proposal with opinion "Rechazo Fuerte"
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on Evaluate a proposal
  And  evaluates its with opinion "Rechazo Fuerte"
  And  leaves a valid comment
  Then evaluation confirmation with opinion "Rechazo Fuerte" should be displayed

Scenario: falling evaluates submission when opinion is empty
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on Evaluate a proposal
  And  evaluates its with opinion " "
  And  leaves a valid comment
  Then it should raise a no opinion selected

Scenario: revisor evaluates a proposal when comment has three words
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks on Evaluate a proposal
  And  evaluates its with opinion "Rechazo Fuerte"
  And  comments "A great comment"
  Then evaluation confirmation with opinion "Rechazo Fuerte" is displayed

Scenario: falling evaluates submission when comment has two words
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks "Evaluate" button
  And  evaluates its with opinion "Rechazo Fuerte"
  And  comments "Poor comment"
  Then evaluation confirmation with opinion "Rechazo Fuerte" is displayed

Scenario: revisor user cannot evaluate a proposal multiple times
  When a revisor user visit proposal list
  And  selects a proposal
  And  clicks "Evaluate" button
  And  evaluates proposal
  And  visits the proposal detail
  Then should not be able to evaluate the proposal