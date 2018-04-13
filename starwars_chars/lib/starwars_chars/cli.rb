class StarwarsChars::CLI
# displays data to user and get some back 

	def call StarwarsChars::API.character_list
		#call the method we just made, that gets the data to the user immediately 
		puts "Welcome to Star Wars Character List Gem"
		puts  ""
		menu

	end 

	def menu
		list_characters
		puts "Please select a character number to get more info."
		input = gets.strip.downcase
		
			
		input = nil 

		if input = "x"
			goodbye
		else int = input.to_i # because of how ruby handles strings. if you send 
		#words to an integer it will become 0	
			if int !=1 && int.between?(1,10)
				selected_character = StarwarsChars::Characters.get_character)(input.to_i -1)
		#grab input from user and send it to charactger class, change itnot usinteger  
		puts "selected_character.name"
		see_more 

	end 

	def list_characters
		StarwarsChars::Character.all.each_with_index[1] do |char, index|
			puts "#{index}.#{selected_character.name}'
		end
	end 

	def char_info(selected_character)
		puts "Name =  #{selected_character.name}"
		puts "#{selected_character.hair}"
		puts "#{selected_character.gender}"
		etc. 

	end

	def goodbye
		puts ""
		puts "See the new movie!"

	end 

	def see_more? 
		puts "see more? y/n"
		new_character = gets.strip.downcase
		if new_character = "y"
			menu

		elsif
			goodbye # and lines 45-46 don't have to be includes. 
		else
			handle_unexpected_input 
		end
	end 

	def handle_unexpected_input 
		puts ""
		puts "Not sure what you mean. Please make a character selection or type X to exit the program"
		puts ""

	end 

	def X
		# do some error=checking? 

end 

# say hi
# trigger loading the data
