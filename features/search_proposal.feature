Feature: Search Proposal

Background:
  Given added proposal with title "Que linda propuesta soy"
  # And with tags "ttd ruby"
  Given added proposal with title "Super propuesta 2020"
  # And with tags "ruby agile"

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
  
  # Scenario: Search by tag and no item found
  # When I search with "label: bdd"
  # Then I should see no results

  # Scenario: Search by tag and item found
  # When I search with "label: tdd"
  # Then I should see 1 results
  # And result should be proposal with title "Que linda propuesta soy"

  # Scenario: Search by tag and more than one item found
  # When I search with "label: ruby"
  # Then I should see 2 results
  # And result should be proposal with title "Que linda propuesta soy"
  # And result should be proposal with title "Super propuesta 2020"
