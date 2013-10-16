class Library
  attr_accessor :books
  def initialize
    @books = []
  end

  def add_book(title)
    raise ArgumentError if title.to_s.strip.length < 1
    @books << title
  end

  def search_by_title(title)
    raise ArgumentError if title.to_s.strip.length < 1
    @books.find_all { |n| n.downcase.match(title.downcase) }
  end

end

require 'sinatra'
#helpers do
#  def library
#    return $library if $library # if we're running tests
    library = Library.new
    library.add_book 'Ruby Programming'
#    library.add_book 'Java Programming'
#    library.add_book 'Perl Programming'
#    library.add_book 'C++ Programming'
#    library.add_book 'C# Programming'
#    library
#  end
#end
get '/' do
  @total_books = library.books.count
  erb :index
end

get '/search' do
  @query = params[:query]
  @results = library.search_by_title(@query)
  erb :search
end

get '/add' do
  @query = params[:query]
  @new_books = library.add_book(@query)
  @total_books = @new_books.count
  erb :add
end
