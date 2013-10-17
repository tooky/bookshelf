class Library

  def initialize
    @books = []
  end

  def clear_books
    @books.clear
  end

  def add_book(title)
    @books << title
  end

  def search_by_title(title)
    raise ArgumentError if title.to_s.strip.length < 1
    @books.find_all { |n| n.match(title) }
  end

end

require 'sinatra'
configure do
  library = Library.new
  library.add_book('Ruby Programming')
  library.add_book('Cucumber Farming')

  set :library, library
end

get '/' do
  erb :index
end

get '/search_by_title' do
  @results = settings.library.search_by_title( params["query"] )

  erb :search_results
end

