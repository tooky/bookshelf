class Library
  def search(searchterm)
    collection.find_all { |book| book == searchterm }
  end

  def collection
    ["alice in wonderland","toad hall","agile development for pros"]
  end
end
