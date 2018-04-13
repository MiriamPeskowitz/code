
class InvalidType < StandardError; end 

class Newsletter
	attr_accessor  :issue_number, :issue_date
	attr_reader :articles

	def initialize
		@articles = []
	end 


	def articles
		@articles.dup.freeze
	end 

	def add_article(article)
		if !article.is_a?(Article)
			raise InvalidType "Must be an Article"
		else
			@articles << article
		end
	end 


	# def first_article_url
	# 	self.articles.first.url
	# 	#many assumptions -- articles is an array; first element must respond to a url method. 
	# end 

end 
