Feature:
  Como Usuario registrado
  quiero no ver el resultado de los votos hasta votar

  Background:
    Given user is logged in

  Scenario: Hides votes until user votes percentage the proposal
    Given a proposal he did not vote yet
    And   user visits proposal list
    Then he should see "votar para ver" in votes percentage column

  Scenario: When user votes he can see percentage of votes
    Given a proposal he already voted
    And   user visits proposal list
    Then he should see "%" in votes percentage column

  @wip
  Scenario: Hide votes until user votes the proposal
    Given a proposal he did not vote yet
    And   user visits proposal detail page
    Then he should not see voting stats

  @wip
  Scenario: Show votes when user votes the proposal
    Given a proposal he did not vote yet
    And   user visits proposal detail page
    When user votes a proposal
    Then he should see voting stats
