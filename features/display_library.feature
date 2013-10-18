Feature: Display the library
  In order to know what books are in the library
  As a user of the bookshelf
  I want to view the entire library

  Scenario: An empty library
    Given a library with 0 books
    When I view the library
    Then I see 0 books

  Scenario: One book in the library
    Given a library with 1 book
    When I view the library
    Then I see 1 book

  Scenario: Many books in the library
    Given a library with 30 books
    When I view the library
    Then I see 30 books
