class Bookshelf
  def initialize(books)
    @books = books
  end

  def search(title)
    set = @books.select { |book| book =~ /#{title}/ }
    Results.new(set)
  end
end
