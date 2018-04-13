# serve the form in the browser
get '/' do
	erb :new
end 

#process input from user and display student and courses

post '/student' do
	@student = Student.new(params[:student])


	params[:student][:courses].each do |details|
		Course.new(details)
	end
	@courses = Course.all
	#this processes the data to call a new object 

	erb :student 
end 
