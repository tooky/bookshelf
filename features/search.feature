Feature: Search

  Scenario: Searching for non-existent books
    Given there are no books with the title I want
    When I search for a book with that title
    Then there should be no results
