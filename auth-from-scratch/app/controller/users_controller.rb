class UsersController <ApplicationController
	get '/signup' do
		
		erb :"users/new.html"
	end 

	post '/users' do 
		@user = User.new
		@user.email = params[:email]
		@user.password = params[:password]
		if @user.save
			redirect '/login'
		else
			erb :'/signup'
		end

	end
end 

Render vs redirect? 
 render when the current request has the data we need. =>erb
If we need the data, we render, if we need taht object and it hasn't been persisted to the db. 
Otherwise, we can move along, and use redirect because we don't need to save the data. 
