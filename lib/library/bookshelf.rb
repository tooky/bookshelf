class Library
  module Bookshelf
    class InMemory
      extend Forwardable

      def_delegators :@books, :size

      def initialize
        @books = []
      end

      def search_by_title(title)
        raise ArgumentError if title.to_s.strip.length < 1
        @books.find_all { |n| n if n.title.downcase.match title.downcase }
      end

      def add(book)
        @books << book
      end
    end
  end
end
