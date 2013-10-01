class Library
  def initialize(collection)
    @collection = collection 
  end

  def search(searchterm)
    @collection.find_all { |book| book == searchterm }
  end
end
