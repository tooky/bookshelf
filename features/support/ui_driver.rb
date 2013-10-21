require 'library'

module DomainDriver

  def library
    @library ||= Library.new
  end

  def search_by_title(title)
    library.search_by_title title, self
  end

  def search_results
    @search_results
  end

  def add_book(title)
    library.add_book title
  end

  def display_search_results(results)
    @search_results = results
  end
end

module WebUIDriver
  def bookshelf
    return @bookshelf if @bookshelf
    db = ::Mongo::MongoClient.new("localhost", 27017).db("bookshelf-test") 
    @bookshelf = Library::Bookshelf::Mongo.new(db)
  end

  def library
    @library ||= Library.new(bookshelf)
  end

  def search_by_title(title)
    visit '/'
    #save_and_open_page
    fill_in 'query', with: title
    click_button 'Search'
  end

  def add_book(book)
    visit '/add'
    fill_in 'title', with: book
    click_button 'Save'
  end

  def search_results
    all('.result').map { |result| Library::Book.new(result.text) }
  end
end

if ENV['DOMAIN']
  puts "Mode: Domain"
  World(DomainDriver)
else
  puts "Mode: Web"
  require 'capybara/cucumber'

  Capybara.app = Sinatra::Application
  Capybara.app.set :environment, :test
  Capybara.save_and_open_page_path = File.expand_path("./tmp/capybara")

  Before do
    Capybara.app.set :library, library
    bookshelf.clear
  end

  World(WebUIDriver)
end
