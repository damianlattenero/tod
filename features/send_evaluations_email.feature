Feature: Poder enviar resultados al autor de una propuesta con al menos tres revisiones

  Background:
    Given an admin user
    And a proposal "A" with 3 revisions
    And a proposal "B" with 2 revisions

  Scenario:  the proposal does have three revisions and should show "notificar resultado" button
    When an admin user visits proposal "A" details
    And    the proposal does have 3 revisions
    Then  should see the "Notificar resultado" button
    When clicks on  "Notificar resultado" button
    Then  it should display  "Mail enviado correctamente"