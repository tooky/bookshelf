require 'sinatra'
require 'sinatra/reloader'

require_relative './library'

configure do
  library = Library.new
  set :library, library
end

register Sinatra::Reloader

get '/' do
  erb :root
end

get '/search' do
  @results = settings.library.search_by_title( params[:query] )
  erb :search_results
end

get '/add' do
  erb :add_book
end

post '/save_book' do
  settings.library.add_book(params[:title])
end
