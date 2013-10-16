require 'bookshelf_app'

module WebUIDriver
  def init
    Sinatra::Application.set :library, Library.new
  end

  def search_by_title(title)
    visit '/'
    fill_in 'query', with: title
    click_button 'submit'
  end

  def add_book(book)
    library.add_book(book)
  end

  def search_results
    all('.result').map do |element|
      element.text
    end
  end

  def library
    Sinatra::Application.settings.library
  end

  def book_count
    @library.count
  end
end

module DomainDriver
  def init
    @library = Library.new
  end

  def library
    @library
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

  def book_count
    @library.count
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

