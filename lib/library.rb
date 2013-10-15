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
helpers do
  def library
    return $library if $library # if we're running tests
    library = Library.new
    10.times {library.add_book 'Some book'}
    library
  end
end
get '/' do
  erb :index
end

get '/search' do
  @query = params[:query]
  @results = library.search_by_title(@query)
  erb :search
end
