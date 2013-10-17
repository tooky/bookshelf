require 'data_mapper'

class Book
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :count, Integer, default: 1

  def increment
    self.count += 1
  end
end
