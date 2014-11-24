Feature: View Proposal List

Background:
  Given a proposal list page without proposals

Scenario: No proposals added
  When I browse the proposal list
  Then I should see no proposals

Scenario: Adding a proposal
  Given someone add proposal "Tod Proposal"
  When I browse the proposal list
  Then I should see proposal "Tod Proposal"

Scenario: Ordered proposals
  Given someone add proposal "Tod Proposal"
  And someone add proposal "Tod Proposal 2"
  When I browse the proposal list
  Then proposal "Tod Proposal 2" has to be on top of "Tod Proposal"