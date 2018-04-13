# n.286 = RUBYWEEKScraper.new(286 ).scrape
# n.286.artilces.first.title 
# 1. we need a scraper class
# 2. that class needs to instantiate the newsletter for that issue number 
# 3. scrape the details 
# 4. scrape the individual articles for that newsletter and add to the instance 

class RubyWeeklyScraper
	attr_accessor :newsletter, :doc

	def initialize(issue_number)
		@newsletter = Newsletter.new
		@newsletter.issue_number = issue_number
		@doc = Nokogiri::HTML(open("http://rubyweekly.com/issues/#{issue_number}"))
	end 

	def scrape
		#return the newsletter, not the scraper object 
		scrape_details
		scrape_articles
		@newsletter
	end 

	def scrape_details 
		@newsletter.issue_date = @doc.search("table.gowide.lonmo").text.gsub("Issue, #{@issue_number} -", "").strip
		
		# popular newsletter with ussue numb and date 
	end 

	def scrape_articles
		#break convention, and let it create articles 
		@doc.search("td[align='left'] table.gowide")[2..-1].each do |article_table| #2..-1 skips the first two weird tables 
			#instantiate article 
			a = Article.new
			# scrape the data
			a.author =  article_table.search("div:first").text.strip
			a.title = article_table.search("a:first").text.strip
			a.url = article_table.search("a:first").attr("href").text.strip

			# now they collaborate
			@newsletter.add_article(a)
			# ? div:first 
			#   a: first attribute -href 
			#   div: last --description 

			# add the article to the newsletter 
			# choice to keep the scraper code only here 
		end
	end 
# @ use s.doc.search

end 
