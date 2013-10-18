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

end

require 'sinatra'
  library = Library.new

get '/' do
  @total_books = library.books.count
  erb :index
end

get '/search' do
  @query = params[:query]
  if @query.to_s.strip.length < 1
    @results = "Invalid book title."
  else
    @results = library.search_by_title(@query)
  end
  erb :search
end

get '/add' do
  @query = params[:query]
  if @query.to_s.strip.length < 1
    @results = "Invalid book title."
  elsif library.books.include?(@query)
    @results = "The book is already on the bookshelf."
  else
    @new_books = library.add_book(@query)
    @total_books = @new_books.count
  end
  erb :add
end
