Feature: Add a book with a title
  In order to add a book
  As a user of a bookshelf
  I want to add a title

  Scenario: The title is added to the bookshelf
    Given a bookshelf with a few books
    When I add a new book
    Then shows new number of books
    And shows the title of added book

  Scenario: The title is not added to the bookshelf
    Given a bookshelf with a few books
    When I add a book which is already on the bookshelf
    Then no books are added 

