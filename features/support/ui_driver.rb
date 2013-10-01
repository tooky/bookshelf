module UIDriver
  def search(searchterm)
    library = Library.new(collection)
    @results = library.search(searchterm)
  end

  def results
    @results
  end

  def collection
    ["alice in wonderland","toad hall","agile development for pros"]
  end
end
