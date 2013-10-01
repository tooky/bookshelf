class Bookshelf
  def initialize
    @books = []
  end

  def search(title)
    set = @books.select { |book| book =~ /#{title}/ }
    Results.new(set)
  end

  def add(book_title)
    @books << book_title  
  end
end
