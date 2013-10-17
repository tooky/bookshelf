require 'mongo'
require 'json/ext'


class Library



  def initialize
    mongo_client = Mongo::MongoClient.new
    db = mongo_client.db("bookshelf")
    coll = db.collection('books')
    @books = coll
  end

  def add_book(title)
    @books.insert({'title' => title})
  end

  def search_by_title(title)
    raise ArgumentError if title.to_s.strip.length < 1
    books = @books.find({'title' => /#{title}/}).to_a
    books.map {|book| book['title'] }
  end

  def clear_bookshelf
    @books.remove
  end

end
