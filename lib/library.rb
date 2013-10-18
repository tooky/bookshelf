class Library
  attr_accessor :books
  def initialize
    @books = []
  end

  def add_book(title)
    raise ArgumentError if title.to_s.strip.length < 1
    if !@books.include?(title)
      @books << title
    end
  end

  def search_by_title(title)
    raise ArgumentError if title.to_s.strip.length < 1
    @books.find_all { |n| n.downcase.match(title.downcase) }
  end

  def number_of_books
    @books.count
  end

  def invalid_title?(query)
    query.to_s.strip.length < 1
  end
end

require 'sinatra'
configure do
  library = Library.new
  set :library, library
  INVALID = "Invalid book title"
  ON_BOOKSHELF = "The book is already on the bookshelf."
end

before do
  @count = settings.library.number_of_books
end

get '/' do
  erb :index
end

get '/search' do
  @query = params[:query]
  if settings.library.invalid_title?(@query)
    @results = INVALID
  else
    @results = settings.library.search_by_title(@query)
  end
  erb :search
end

get '/add' do
  @query = params[:query]
  if settings.library.invalid_title?(@query)
    @results = INVALID
  elsif settings.library.books.include?(@query)
    @results = ON_BOOKSHELF
  else
    settings.library.add_book(@query)
    @count = settings.library.number_of_books
  end
  erb :add
end
