Feature: Show download link to attached file on proposal
  Como cualquier usuario
  quiero al adjuntar un archivo a una propuesta poder ver un link al archivo

  Background:
    Given new proposal page
    And proposal title "Proposal"
    And a description "This is a proposal"
    And author nick "Author"
    And email "author@tod.com"

  Scenario: Shows download link in proposal detail when there is an attached file
    Given uploaded file is "welcome.png"
    When submitting
    Then file is attached

  Scenario: Doesn't show download link in proposal detail if there is NO attached file
    Given user decides no uploadding file
    When submitting
    Then there is no file attached
