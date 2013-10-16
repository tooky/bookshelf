require 'sinatra/base'
require 'library'

class BookshelfApp < Sinatra::Base

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

  run! if app_file == $0
end
