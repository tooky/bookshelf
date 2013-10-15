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
get '/' do 
  %{
<html>
<head></head>
<body>
  <form method="POST">
    <input type="text" id="query" name="booktitle" />

	   <button id="search">Search</button>

  </form>
</body>
</html>
}
end

post '/' do
  "The book you searched for was " + params[:booktitle]

end


