Feature: Find a book by title
  In order to find a book
  As a user of a bookshelf
  I want to search by title

  Scenario: No such book on empty bookshelf
    Given an empty bookshelf
    When I search for a book
    Then shows no results found

  Scenario: No such book on bookshelf
    Given a bookshelf with one book
    When I search for a non existent book
    Then shows no results found

  Scenario: Found book on bookshelf
    Given a bookshelf with one book
    When I search for a book
    Then shows the book

  Scenario: Found book on bigger bookshelf
    Given a bookshelf with a few books
    When I search for a book
    Then shows the book

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
    Then I see a message that the book is already on the bookshelf 
