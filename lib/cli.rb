require "pry"

class CLI
  def run

    puts "Welcome to your coming soon database!"
    puts "What movie would you like to see?"
    Scraper.scrape_imdb
    
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i} #{movie.title}"
    end
  end
  
end