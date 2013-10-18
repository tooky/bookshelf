require 'sinatra'
require 'library'

describe "Library" do
  subject { Library.new }

  let(:title) { 'Ruby Programming' }

  before(:each) do
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.finalize.auto_migrate!
  end

  it 'should find a book if the search matches a book in the library' do
    mysearch = "Grape"
    subject.add_book( mysearch )
    result = subject.search_by_title( mysearch )
    expect(result.map(&:title)).to eq(["Grape"])
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
    expect(subject.search_by_title(mysearch).map(&:title)).to eq(['Sociology','Psychology'])
  end

  it 'should group identical books together' do
    4.times { subject.add_book(title) }
    expect(subject.count).to eq(1)
    expect(subject.search_by_title(title).first.count).to eq(4)
  end
end
