Feature: Comment a Proposal

 Background:
   Given a proposal
   Given details proposal page

 Scenario: Add a comment
   And comment body "Body"
   And the author "Hache"
   When submitted
   Then the comment is added and listed on the proposal view

 Scenario: Ordered comments
   Given a proposal
   And comment body "Body"
   And the author "Hache"
   When submitted
   And comment body "Body 2"
   And the author "Hache2"
   When submitted
   Then I should see comment from "Hache2" on top of comment from "Hache"