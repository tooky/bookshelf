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

    require 'mongo'
    class Mongo
      def initialize(database)
        @database = database
        @collection = database["books"]
      end

      def add(book)
        @collection.insert(title: book.title)
      end

      def search_by_title(title)
        raise ArgumentError if title.to_s.strip.length < 1
        @collection.find({ title: /#{title}/i }).map do |result|
          Library::Book.new(result["title"])
        end
      end

      def size
        @collection.count
      end

      def clear
        @collection.remove
      end
    end
  end
end
