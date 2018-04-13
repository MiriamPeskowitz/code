Trail: 

THis is the Domain Model
TItle: string
Description: text
Image_url: string
difficulty: ENUM
length: Integer

Idea: build custome writers for the 

In rails you can type this in Rails g model hike title: storng, etc. 
and it creates your tables. 

ActiveRecord ENUM: 

class Trail <ActiveRecord???
	enum difficulty: [:easy, :moderate, :hard]
	# based on an integer level, 0,1,2, etc. 
	# enum is the same as... like att_accessor, it gives you methods, the bang, and the questions mark. 

	# def easy!
	# 	self.update(difficulty:0)
	# end 

	# def easy? 
	# 	self.difficulty == 0

	# def moderate!
	# 	self.update(difficulty :1)
	# end 

	# def moderate? 
	# 	self.difficulty = 1
	# end etc, etc. 
	 #active record takes the place of attr_accessors 

def difiiculty=(diffultu)
	write_attribute("difficytly ")
	

	# Trail.new(trails_params 
	# {title: "Mt.Hood', description: "Horible hike, length: 15, 
	# 	, image_url: ...., difficulty: "1"})

# custom attribute writer rails 5 -- google this 
# It's that you dont' give up. 

end



class CreateTrail < ActiveRecord

def change 

	t.string  :title
	t.text    :description
	t.string  :image_url
	t.ENUM 	:difficulty
	t.integer :length

end 

class TrailsController < ApplicationContoller

	def index

		@trails = trails.all 
	end 

	def new

	end 

	def create
		byebug
		@trail = Trail.new(trail_params)

	end 	

	private 
	def trail_params
		params.require("trail").permit("title", "description", "image_url", "length", "difficulty")

	end 
end

index.html.erb

<%=ink_to 
<% @trails.each do |trail|%>
<%


*** t.image_url = "url"




end 