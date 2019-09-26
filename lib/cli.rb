require "pry"

class CLI
  def run

    puts "Welcome to your coming soon database!"
    puts "What movie would you like to see?"
    Scraper.scrape_imdb
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i} #{movie.title}"
    end
    menu
  end
  
  def menu
    puts "Please select a movie to get the details."
    input = gets.chomp
    movie = Movie.all[input.to_i-1]
    
    if !movie
      puts "Movie not found. Please select a different movie!"
      menu
    else
      Scraper.scrape_individual_movie(movie)
      puts "Here are the details for #{movie.title}:"
      puts "Rating: #{movie.rating}"
      puts "Runtime: #{movie.runtime}"
      puts "Summary: #{movie.summary}"
    end
  end
  
end