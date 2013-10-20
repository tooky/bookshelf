Given(/^an empty bookshelf$/) do
end

Then(/^shows no results found$/) do
  expect( search_results ).to be_empty
end

Given(/^a bookshelf with one book$/) do
  add_book "Ruby Programming"
end

When(/^I search for a non existent book$/) do
  search_by_title 'Banana'
end

When(/^I search for a book$/) do
  search_by_title 'Ruby'
end

When(/^I search for a book using lowercase$/) do
  search_by_title 'ruby'
end

Then(/^shows the book$/) do
  expect( search_results ).to eq [Library::Book.new("Ruby Programming")]
end

Given(/^a bookshelf with a few books$/) do
  add_book "Ruby Programming"
  add_book "Java Programming"
  add_book "Perl Programming"
  add_book "C# Programming"
end
