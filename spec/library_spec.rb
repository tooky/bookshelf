require 'library'

describe "Library" do
  subject { Library.new }

  it 'should find a book if the search matches a book in the library' do
    mysearch = "Grape"
    subject.add_book( mysearch )
    result = subject.search_by_title( mysearch )
    expect(result).to eq(["Grape"])
  end

  it 'should error when searching with empty string' do
    mysearch = ""
    expect{subject.search_by_title(mysearch)}.to raise_error(ArgumentError)
  end

  it 'should error when searching with whitespace only string' do
    mysearch = "  "
    expect{subject.search_by_title(mysearch)}.to raise_error(ArgumentError)
  end

  it 'should error when searching with nil' do
    expect{subject.search_by_title(nil)}.to raise_error(ArgumentError)
  end

  it 'should find books with a partial match' do
    subject.add_book( 'Sociology' )
    subject.add_book( 'Psychology' )
    subject.add_book( 'History' )
    mysearch = "ology"
    expect(subject.search_by_title(mysearch)).to eq(['Sociology','Psychology'])
  end

  it 'should perform a search that is not case-sensitive' do
    subject.add_book( "Ruby Programming" )
    mysearch = "ruby"
    expect(subject.search_by_title(mysearch)).to eq(["Ruby Programming"])
  end

  it 'should count the number of books on the bookshelf' do
    subject.add_book( "Ruby Programming" )
    subject.add_book( "Perl Programming" )
    expect(subject.books.count).to eq 2
  end

  it 'should not add the book that is already on the bookshelf' do
    subject.add_book( "Ruby Programming" )
    subject.add_book( "Ruby Programming" )
    expect(subject.books.count).to eq 1
  end

  it 'should error when trying to add an empty string ' do
    title = ""
    expect{subject.add_book( title )}.to raise_error(ArgumentError)
  end

  it 'should error when trying to add whitespace ' do
    title = "   "
    expect{subject.add_book( title )}.to raise_error(ArgumentError)
  end

  it 'should error when trying to add nil' do
    title = nil
    expect{subject.add_book( title )}.to raise_error(ArgumentError)
  end
end
