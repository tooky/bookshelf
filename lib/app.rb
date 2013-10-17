require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require 'dm-migrations'

require_relative './library'
require_relative './book'

unless ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://postgres:postgres@localhost/bookshelf')
  DataMapper.finalize.auto_upgrade!
end

configure do
  library = Library.new
  set :library, library
end

register Sinatra::Reloader

get '/' do
  if params[:query]
    @results = settings.library.search_by_title(params[:query])
  end
  erb :root
end

get '/add' do
  erb :add_book
end

post '/save_book' do
  settings.library.add_book(params[:title])
end
