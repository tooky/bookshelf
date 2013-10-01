require_relative '../../library'

Given(/^there are no books with the title I want$/) do
  @searchterm = "Coocumber"
end

When(/^I search for a book with that title$/) do
  @results = Library.new.search(@searchterm)
end

Then(/^there should be no results$/) do
  expect(@results).to have_exactly(0).items
end
