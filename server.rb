require 'sinatra'
require_relative 'lib/library'

configure do
  set :library, Library.new
end

get '/' do 
  erb :index
end

post '/' do
  books = settings.library.search_by_title(params[:booktitle])
  erb :results, locals: { books: books }
end
