Given(/^there are no books with the title I want$/) do
  @searchterm = "Coocumber"
end

When(/^I search for a book with that title$/) do
  @results = Library.new.search(@searchterm)
end

Then(/^there should be no results$/) do
  expect(@results).to have_exactly(0).items
end

class Library
  def search(searchterm)
    collection.find_all { |book| book == searchterm }
  end

  def collection
    ["alice in wonderland","toad hall","agile development for pros"]
  end
end
