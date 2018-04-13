class StarwarsChars::Characters
	attr_accessor :name, :hair_color, :mass, :gender # make an attr accessor for each attribute 
	@@all # to hold everything when you want to list all the names. 

	def self.new_from_JSON(char)
		#will create the new instance for every piece of data that's passed in
		self.new(
			char["name"],
			char[hair_color],
			char["mass"],
			char[gender]
			)
	end # square brackets 


	def initialize(name=nil, hair_color=nil, eye_color=nil, gender=nil)
		@name = name
		@hair_color = hair_color
		@gender = gender
		@@all << self 
	end 

	def self.all
		@@all
	end 
	#protect your variables, don't expose class level methods to the rest of the world and other classes, that why we create this method 
	# take a bunch of data that's out there and make it into a things. 

	def self.get_character(num) #find method 
		self.all(num)
	end 




end 