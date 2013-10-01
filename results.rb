class Results

  def initialize(books)
    @books = books
  end

  def books
    @books
  end

  def [](index)
    @books[index]
  end
end
