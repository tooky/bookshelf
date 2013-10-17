require 'data_mapper'

class Book
  include DataMapper::Resource

  property :id, Serial
  property :title, String
end
