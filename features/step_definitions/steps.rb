Given(/^an empty bookshelf$/) do
  library.books = []
end

When(/^I search for a non existent book$/) do
  search_by_title 'banana'
end

Then(/^shows no results found$/) do
  expect( search_results ).to be_empty
end

Given(/^a bookshelf with one book$/) do
  add_book "Ruby Programming"
end

When(/^I search for a book$/) do
  search_by_title 'ruby'
end

Then(/^shows the book$/) do
  expect( search_results ).to eq ["Ruby Programming"]
end

Given(/^a bookshelf with a few books$/) do
  add_book "Ruby Programming"
  add_book "Java Programming"
  add_book "Perl Programming"
  add_book "C# Programming"
end

When(/^I add a new book$/) do
  add_book "JavaScript"
end

Then(/^shows new number of books$/) do
  expect( library.books.count ).to eq 5
end

Then(/^shows the title of added book$/) do
  expect( library.books.last ).to eq "JavaScript"
end

When(/^I add a book which is already on the bookshelf$/) do
  add_book "Ruby Programming"
end

Then(/^no books are added$/) do
  expect( library.books ).to eq ["Ruby Programming", "Java Programming",
                         "Perl Programming", "C# Programming"]
end

Given(/^I am on home page$/) do
  visit "/"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |element, text|
  fill_in element, with: text
end

Given(/^there is a book "(.*?)" on the bookshelf$/) do |book|
  visit "/add?query=Ruby+Programming"
end

When(/^I click "(.*?)"$/) do |button|
  click_on button
end

Then(/^I should see a result with "(.*?)"$/) do |book|
  visit "/search?query=ruby"
  page.should have_content(book)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should see "(.*?)" box$/) do |arg1|
  page.should have_field(arg1)
end

Then(/^I should see "(.*?)" button$/) do |arg1|
  page.should have_button(arg1)
end

Given(/^there is no book on the bookshelf$/) do
end

Then(/^I should see that the "(.*?)" has been added$/) do |arg1|
  visit "/add?query=Ruby+Programming"
  page.should have_content("The book #{arg1} has been added to the library.")
end

Given(/^there is already a book "(.*?)" on the bookshelf$/) do |arg1|
  visit "/add?query=Ruby+Programming"
end

Then(/^I should see that the book has not been added$/) do
  visit "/add?query=Ruby+Programming"
  page.should have_content("The book is already on the bookshelf.")
end
