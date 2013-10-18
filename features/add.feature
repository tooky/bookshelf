Feature: Add a book to the bookshelf
  In order to add a book
  As a user of the bookshelf
  I want to enter a book title

  Scenario: Add a book that is not on the bookshelf
    Given I am on home page
    And I fill in "query" with "Ruby Programming"
    And there is no book on the bookshelf
    When I click "Add a book"
    Then I should see that the "Ruby Programming" has been added

  Scenario: Add a book that is already on the bookshelf
    Given I am on home page
    And I fill in "query" with "Ruby Programming"
    And there is already a book "Ruby Programming" on the bookshelf
    When I click "Add a book"
    Then I should see that the book has not been added
