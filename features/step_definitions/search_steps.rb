Given(/^there are multiple books with similar titles$/) do
  initialize_bookshelf
end

When(/^I search for a book title$/) do
  search_for_title("Cucumber")
end

Then(/^I see multiple results$/) do
  expect( @results ).to have_at_least(2).books
  expect_all_results_to_match("Cucumber")
end

World(UIDriver)
