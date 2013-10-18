require 'mongo'
require 'json/ext'

class Library

  def initialize(db_shelf)
    puts "I'm using the #{db_shelf}"
    mongo_client = Mongo::MongoClient.new
    db = mongo_client.db(db_shelf)
    coll = db.collection('books')
    @books = coll
  end

  def add_book(title)
    check_input(title)
    @books.insert({'title' => title})
  end

  def search_by_title(title)
    check_input(title)
    books = @books.find({'title' => /#{title}/}).to_a
    books.map {|book| book['title'] }
  end

  def check_input(title)
    raise ArgumentError if title.to_s.strip.length < 1
  end

  def clear_bookshelf
    @books.remove
  end

end
