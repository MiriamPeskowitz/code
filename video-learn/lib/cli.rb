
class RubyWeeklyController

# this started off in the bin file, but it's really its own object and it knows about other objects, os move it here 

	def initialize
		puts "Welcome to RubyWeekly"

		s = RubyWeeklyScraper.new(286)
		@newsletter = s.scrape
	end 

	def call
		input = ""

		while input != "exit"
			puts "what would you like to do, list or exit? "
			input = gets.strip
			case input
			when "list"
				list_articles
				puts "pick which one you'd like to read"
				
			when "exit"
				puts "goodbye"
				break

			else
				system("open #{@newsletter.articles[input.to_i-1].url}")

			end
		end 
	end 


	def list_articles
		@newsletter.articles.each_with_index do |a, i|
			puts "#{i}. #{a.title}"
		end 
	end 

	def pick_article
		puts "pick an article to read"
		input = gets.strip
	end

end 

# program in the immediate place where you are -- then move it around to where it makes more sense in your model 

# cut things that get too long -- design and program at the same time, eventually 
# how to make things clearn and easy to extend. 


