Feature: Search for a book
  In order to find a book on the bookshelf
  As a user of the bookshelf
  I want to search for a book

  Scenario: View the home page
    Given I am on home page
    Then I should see "Library"
    And I should see "query" box
    And I should see "Search" button
    And I should see "Add a book" button

  Scenario: Click on Search button
    Given I am on home page
    And I fill in "query" with "ruby"
    And there is a book "Ruby Programming" on the bookshelf
    When I click "Search"
    Then I should see a result with "Ruby Programming"

