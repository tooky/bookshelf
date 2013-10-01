Given(/^there are no books with the title I want$/) do
  @library = ["alice in wonderland","toad hall","agile development for pros"]
  @searchterm = "Coocumber"
end

When(/^I search for a book with that title$/) do
  @results = search(@searchterm)
end

Then(/^there should be no results$/) do
  expect(@results).to have_exactly(0).items
end

def search(searchterm)
  @library.find_all { |book| book == searchterm }
end
