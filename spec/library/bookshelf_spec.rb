require 'library'

module Library::Bookshelf
  shared_examples_for 'a bookshelf' do
    it 'should find a book if the search matches a book in the library' do
      bookshelf.add( a_book("Grape") )

      bookshelf.search_by_title( "Grape" ).should include( a_book("Grape") )
    end

    it 'should error when searching with empty string' do
      expect{bookshelf.search_by_title("")}.to raise_error(ArgumentError)
    end

    it 'should error when searching with whitespace only string' do
      expect{bookshelf.search_by_title("   ")}.to raise_error(ArgumentError)
    end

    it 'should error when searching with nil' do
      expect{bookshelf.search_by_title(nil)}.to raise_error(ArgumentError)
    end

    it 'should find books with a partial match' do
      bookshelf.add a_book( 'Sociology' )
      bookshelf.add a_book( 'Psychology' )
      bookshelf.add a_book( 'History' )

      expect( bookshelf.search_by_title("ology") ).to eq(
        [a_book('Sociology'), a_book('Psychology')]
      )
    end

    it "ignores case when searching" do
      bookshelf.add a_book( 'Sociology' )

      expect( bookshelf.search_by_title("sociology") ).to eq(
        [Library::Book.new('Sociology')]
      )
    end

    def a_book(title)
      Library::Book.new(title)
    end
  end

  describe InMemory do
    let(:bookshelf) { InMemory.new }

    it_should_behave_like 'a bookshelf'
  end
end
