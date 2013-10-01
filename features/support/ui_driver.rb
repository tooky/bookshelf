require_relative '../../bookshelf.rb'
require_relative '../../results.rb'
require_relative '../../library.rb'

module UIDriver
  def initialize_bookshelf
    @bookshelf = Bookshelf.new
    @bookshelf.add("Cucumber")
    @bookshelf.add("Return of the Cucumber")
  end

  def search_for_title(title)
    @results = @bookshelf.search(title)
  end

  def expect_all_results_to_match(title)
    expect( @results[0] ).to match(/#{title}/)
    expect( @results[1] ).to match(/#{title}/)
  end

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
