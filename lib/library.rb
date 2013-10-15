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

class WebLibrary
  def self.library
      @library ||= Library.new
  end
end

require 'sinatra'
get '/'  do
  %{<html>

      <body>
        <form method="get" action="/search">
          <input type="text" id="query" name="query"/>
          <input type="submit" id="Search">
        </form>
      </body>
  </html>
  }
end

get '/search' do
  query = params['query']
#puts query.inspect

  
  results = WebLibrary.library.search_by_title(query)


  head = %{<html><body><ul id="search_results">}
  list_items = results.map { |r_item| "<li>#{r_item}</li>" } 
  footer = %{</ul></body></html>}

  [head, list_items, footer].flatten
end

get '/add_book'  do
  book_to_save = params['book_name']
  if !book_to_save.nil?
    WebLibrary.library.add_book(book_to_save)
  end

  %{<html>

      <body>
        <form method="get" action="/add_book">
          <input type="text" id="book_name" name="book_name"/>
          <input type="submit" id="Save" name"Save">
        </form>
      </body>
  </html>
  }
end
