Feature: Comment a Proposal

 Background:
   Given details proposal page

 Scenario: Add a comment
   Given a proposal
   And comment body "Body"
   And the author "toti"
   When submitted
   Then the comment is added and listed on the proposal view

 Scenario: Ordered comments
   Given a proposal
   And comment body "Body"
   And the author "toti"
   And submitted
   And comment body "Body 2"
   And the author "manie"
   When submitted
   Then I should see comment from "toti" on top of comment from "manie"