module UIDriver
  def search(searchterm)
    @results = Library.new.search(searchterm)
  end

  def results
    @results
  end
end
