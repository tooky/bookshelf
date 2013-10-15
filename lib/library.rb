class Library

  def initialize
    @books = []
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
  set :library, library
end

get '/' do
  %{<html>
    <head></head>
    <body>
      <form action="/search" method="get">
        <input type="text" id="query" name="query" />
        <input type="submit" id="submit" value="Search" />
      </form>
    </body>
    </html>
  }
end

get '/search' do
  @results = settings.library.search_by_title( params[:query] )
  erb :search_results
end
