Feature: Search Proposal

Background:
  Given added proposal with title "Que linda propuesta soy" and "tdd ruby" tags
  Given added proposal with title "Super propuesta 2020" and "ruby agile" tags
  Given added proposal with title "Titulo pomposo" and "ruby agile scrum xtreme" tags
  Given added proposal with title "Otro titulo, que loco no?" and "ruby ddd" tags

Scenario: Search by title and no item found
  When I search with "asd"
  Then I should see no results

Scenario: Search by title and item found
  When I search with "2020"
  Then I should see 1 results
  And result should be proposal with title "Super propuesta 2020"

Scenario: Search by title and more than one item found
  When I search with "propuesta"
  Then I should see 2 results
  And result should be proposal with title "Que linda propuesta soy"
  And result should be proposal with title "Super propuesta 2020"

Scenario: Search by tag and no item found
  When I search with "bdd"
  Then I should see no results

Scenario: Search by tag and item found
  When I search with "tdd"
  Then I should see 1 results
  And result should be proposal with title "Que linda propuesta soy"

Scenario: Search by tag and more than one item found
  When I search with "ruby"
  Then I should see 4 results
  And result should be proposal with title "Que linda propuesta soy"
  And result should be proposal with title "Super propuesta 2020"
  And result should be proposal with title "Titulo pomposo"
  And result should be proposal with title "Otro titulo, que loco no?"

Scenario: Search by existent title word AND other non existent word and none item found
  When I search with "propuesta + dona"
  Then I should see no results

Scenario: Search by existent title word OR other non existent word and more than one item found
  When I search with "propuesta dona"
  Then I should see 2 results
  And result should be proposal with title "Que linda propuesta soy"
  And result should be proposal with title "Super propuesta 2020"

Scenario: Search by existent title word AND other existent tag and one item found
  When I search with "propuesta + agile"
  Then I should see 1 results
  And result should be proposal with title "Super propuesta 2020"

Scenario: Search by existent title word AND other existent tag and more than one item found
  When I search with "titulo + ruby"
  Then I should see 2 results
  And result should be proposal with title "Titulo pomposo"
  And result should be proposal with title "Otro titulo, que loco no?"
