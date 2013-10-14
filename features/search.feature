Feature: Searching the bookshelf
  I want to search the bookshelf
  As a reader
  To find a book I can take out on loan

  Scenario: Multiple search results
    Given there are multiple books with similar titles
    When I search for a book title
    Then I see multiple results

	Scenario: Searching for non-existent books
    Given there are no books with the title I want
    When I search for a book with that title
    Then there should be no results