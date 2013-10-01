Feature: Searching the bookshelf
  I want to search the bookshelf
  As a reader
  To find a book I can take out on loan

  Scenario: Multiple search results
    Given there are multiple books with similar titles
    When I search for a book title
    Then I see multiple results
