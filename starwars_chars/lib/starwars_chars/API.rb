class StarwarsChars::API
	def self.character_list
		char = RestClient.get("https://swapi.co/api/people")
		@character_list = JSON.parse(char)
		character_list[results].each do |char.new_from_JSON(char)}
		
	end 
end 


def self.character_list 

#loop through the results and get that into the other class, and 
	character_list{results}.each do |char.new_from_JSON(char)}  
	#This is how we pass it to the character class 

end 


From the other class: 

new_from_JSON(character data)
end
