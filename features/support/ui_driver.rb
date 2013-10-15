require 'library'

module DomainDriver

  def library
    @library ||= Library.new
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
  def search_by_title(title)
    visit '/'
    fill_in 'Query', with: title
    click_button 'Title'
  end
end

if ENV['WEB_UI']
  require 'capybara/cucumber'
  Capybara.app = Sinatra::Application
  World(WebUIDriver)
else
  World(DomainDriver)
end

