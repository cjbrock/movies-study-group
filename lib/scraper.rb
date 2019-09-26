require "open-uri"
require "nokogiri"

class Scraper
  IMDB_URL = "https://www.imdb.com/"
  
  def self.scrape_imdb
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)
    doc.css(".rhs-body")[0].css(".rhs-row").each do |movie_element|
      title = movie_element.css(".title").text.strip
      url = movie_element.css(".title a").attr("href").value
      Movie.new(title, url)
    end
  end
  
  def self.scrape_individual_movie(movie)
    html = open(IMDB_URL+movie.url)
    doc = Nokogiri::HTML(html)
    movie.rating = doc.css(".subtext").text.split("\n")[1].strip
    movie.runtime = doc.css(".subtext").text.split("\n")[3].strip
    movie.summary = doc.css(".summary_text").text.strip
  end
  
  
end