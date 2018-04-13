class PostsController < ApplicationController

	get '/posts' do 
		"You are logged in as #{session[:email]}"
		"A list of publically available posts"
	end 
#
	get '/posts/new' do
		#check if logged in
		if !session[:email] # change to "!logged_in "
			#abstract this -- login
			redirect '/login' #redirect if they aren't 
		else 
			"a new post form "
		end 
	end 

	get '/posts/:id/edit' do 
		#check if logged in
		#find a post that can be edited 
		
		if logged_in?
			redirect '/login' #redirect if they aren't 
		else 
			if post = current_user.posts.find(params[:id])
			# if post.user_id == current_user.id -refacgtored line above 
				"an edit post form #{current_user.id} is editing #{post.id}"
			else
				redirect '/posts'
			end 	
		end 
	end 
end
 
