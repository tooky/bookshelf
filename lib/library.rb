require_relative './book'

class Library
  def add_book(title)
    book = Book.first(title: title)

    if book then book.increment
    else Book.create!(title: title)
    end
  end

  def search_by_title(title)
    raise ArgumentError if title.to_s.strip.length < 1
    Book.all.select { |book| book.title.match(title) }.map(&:title)
  end

  def count
    Book.count
  end
end
