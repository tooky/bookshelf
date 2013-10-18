require 'app'
require 'data_mapper'

module WebUIDriver
  def init
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.finalize.auto_migrate!
    Sinatra::Application.set :library, Library.new
  end

  def view_library
    visit '/'
  end

  def visible_books
    all('.book').map(&:text)
  end

  def search_by_title(title)
    visit '/'
    fill_in 'query', with: title
    click_button 'submit'
  end

  def add_book(title)
    visit '/add'
    fill_in 'title', with: title
    click_button 'save'
  end

  def search_results
    all('.result').map(&:text)
  end

  def library
    Sinatra::Application.settings.library
  end

  def book_count
    library.count
  end
end

module DomainDriver
  def init
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.finalize.auto_migrate!
    @library = Library.new
  end

  def visible_books
    Book.all
  end

  def view_library
  end

  def library
    @library
  end

  def search_by_title(title)
    @search_results = library.search_by_title title
  end

  def search_results
    @search_results.map(&:title)
  end

  def add_book(title)
    library.add_book title
  end

  def book_count
    library.count
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

