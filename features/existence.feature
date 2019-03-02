Feature: Existence

  As a user
  So that I can visit different pages
  I want to include directories that exists

Background: directories must exist

  Given I am on the homepage

  Scenario: Existence #1
    Then the directory "/people" should exist

  Scenario: Existence #2
    Then the directory "/rules" should exist

  Scenario: Existence #3
    Then the directory "/instructions" should exist

  Scenario: Existence #4
    Then the directory "/login" should exist

  Scenario: Existence #5
    Then the directory "/confirm-account" should exist
