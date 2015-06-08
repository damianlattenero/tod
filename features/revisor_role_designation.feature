Feature: Revisors designated by Admin

Background:
  Given an admin user
  And   a regular user

Scenario: regular user as revisor
  When admin designates regular user as revisor
  Then regular user should be revisor