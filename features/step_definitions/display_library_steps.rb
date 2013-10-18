Given(/^a library with (\d+) books?$/) do |number|
  number.times do |time|
    library.add_book("Book number #{time}")
  end
end

When(/^I view the library$/) do
  view_library
end

Then(/^I see (\d+) books?$/) do |number|
  expect(visible_books.count).to eq(number)
end
