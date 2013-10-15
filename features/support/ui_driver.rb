require 'library'

#module UIDriver
module DomainDriver

  def library
    @library ||= Library.new
  end

  def search_by_title(title)
    @search_results = library.search_by_title title
  end

  def search_results 
    @search_results
  end

  def add_book(title)
    library.add_book title
  end

end

module WebUIDriver
 def search_by_title(title)
    visit '/'
   
    fill_in 'query', with: title
    click_button 'Search'

  end

  def search_results 
          save_and_open_page

     all("li").collect { |item| item.text }

  end

  def add_book(title)
    #library.add_book title
    visit '/add_book'
    fill_in 'book_name', with: title
    click_button 'Save'

  end 
end

if ENV['DOMAIN']
  World(DomainDriver)
else
  require 'capybara/cucumber'
  Capybara.app = Sinatra::Application
  Capybara.app.set :environment, :test
  Capybara.save_and_open_page_path = File.expand_path("./tmp/capybara")
  World(WebUIDriver)
end 

#World(UIDriver)

