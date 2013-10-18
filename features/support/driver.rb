require 'library'

module DomainDriver

  def library
    @library ||= Library.new
  end

  def clear_books
    library.clear_books
  end

  def search_by_title(title)
    @search_results = library.search_by_title title
  end

  def search_results 
    @search_results
  end

  def add_book(title)
    library.add_book title
  end

end

module WebUIDriver

  def library
    Sinatra::Application.settings.library
  end

  def clear_books
    library.clear_books
  end

  def search_by_title(title)
    visit '/'
#    save_and_open_page
    fill_in 'query', with: title
    click_button 'Search'
  end

  def add_book(title)
    visit '/add_book'
    fill_in 'title', with: title
    click_button 'Add'
  end

  def search_results
    all('#results li').map { |element| element.text }
#    all('#results li').map &:text
  end

end

if ENV['DOMAIN']
  World(DomainDriver)
else
  require 'capybara/cucumber'

  Capybara.app = Sinatra::Application
  Capybara.app.set :environment, :test
  Capybara.save_and_open_page_path = File.expand_path("./tmp/capybara")
  World(WebUIDriver)
end

