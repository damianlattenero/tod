Feature: Adding proposal with attached file

  Background:
    Given new proposal page

  Scenario: Adding a proposal that complies
    Given proposal title "Proposal"
    And a description "This is a proposal"
    And author nick "Author"
    And email "author@tod.com"
    And uploaded file is "welcome.png"
    When submitting
    Then file is attached
