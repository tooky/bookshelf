Transform(/^(\d+)$/) do |number|
  number.to_i
end

Given(/^a library with (\d+) books in it$/) do |no_of_books|
  no_of_books.times do |book|
    library.add_book("book number #{no_of_books}")
  end
end

When(/^I add a book$/) do
  library.add_book("The Cucumber Book")
end

Then(/^there will be (\d+) books in the library$/) do |no_of_books|
  expect(book_count).to eq(no_of_books)
end
