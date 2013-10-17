require_relative './book'

class Library
  def initialize
  end

  def add_book(title)
    Book.create!(title: title)
  end

  def search_by_title(title)
    raise ArgumentError if title.to_s.strip.length < 1
    Book.all.select { |book| book.title.match(title) }.map(&:title)
  end

  def count
    Book.count
  end
end
