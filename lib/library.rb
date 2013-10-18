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
    @books.find_all { |n| n.match(/#{title}/i) }
  end

  def book_count
    @books.size
  end

end

require 'sinatra'
require 'sinatra/reloader'

configure do
  library = Library.new
  library.add_book('Ruby Programming')
  library.add_book('Cucumber Farming')

  set :library, library
end

register Sinatra::Reloader

get '/' do
  @book_count = settings.library.book_count
  erb :index
end

get '/search_by_title' do
  begin
    @results = settings.library.search_by_title( params[:query] )
    @query = params[:query]
    erb :search_results
  rescue
    redirect '/'
  end
end

get '/add_book' do
  erb :add_book
end

post '/add_book' do
  settings.library.add_book params[:title]
  @added_title = params[:title]
  erb :add_book
end
