#require "bundler/setup"
require 'sinatra/base'
require 'json'
require './lib/library'

class BookshelfApp < Sinatra::Base

  configure do
    set :library, Library.new
  end

  get '/' do 
    erb :index
  end

  get '/add' do 
    erb :add
  end

  get '/books.json' do
    content_type :json
    { :book1 => 'Ruby Programming', :book2 => 'Java Programming' }.to_json
  end

  post '/' do
    books = settings.library.search_by_title(params[:booktitle])
    erb :results, locals: { books: books, message: "Library has found:"  }
  end

  post '/add' do
    books = settings.library.add_book(params[:booktitle])
    erb :results, locals: { books: books, message: "Library contains:" }
  end

  run! if app_file == $0
end
