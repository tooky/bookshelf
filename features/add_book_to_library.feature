Feature: Add a book to the library
  In order to add a book to the library
  As a librarian
  I want to enter and save the details of the book

  Scenario: An empty library
    Given a library with 0 books in it
    When I add a book
    Then there will be 1 books in the library

  Scenario: A non-empty library
    Given a library with 7 books in it
    When I add a book
    Then there will be 8 books in the library
