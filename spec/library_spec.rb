require 'library'

describe "Library" do 
  subject { Library.new }
  let(:ui) { double(:ui) }

  it 'should find a book if the search matches a book in the library' do
    mysearch = "Grape"
    subject.add_book( mysearch )

    ui.should_receive(:display_search_results).with([Library::Book.new("Grape")])

    subject.search_by_title( mysearch, ui )
  end

  it 'should error when searching with empty string' do
    mysearch = ""
    expect{subject.search_by_title(mysearch, ui)}.to raise_error(ArgumentError)
  end

  it 'should error when searching with whitespace only string' do
    mysearch = "  "
    expect{subject.search_by_title(mysearch, ui)}.to raise_error(ArgumentError)
  end

  it 'should error when searching with nil' do
    expect{subject.search_by_title(nil, ui)}.to raise_error(ArgumentError)
  end

  it 'should find books with a partial match' do
    subject.add_book( 'Sociology' )
    subject.add_book( 'Psychology' )
    subject.add_book( 'History' )
    mysearch = "ology"

    ui.should_receive(:display_search_results).with(
      [Library::Book.new('Sociology'),Library::Book.new('Psychology')]
    )

    subject.search_by_title(mysearch, ui)
  end
end
