require "open-uri"
require "nokogiri"

class Scraper
  
  def self.scrape_imdb
    html = open("https://www.imdb.com/")
    doc = Nokogiri::HTML(html)
    doc.css(".rhs-body")[0].css(".rhs-row").each do |movie_element|
      title = movie_element.css(".title").text.strip
      Movie.new(title)
    end
  end
  
  
end