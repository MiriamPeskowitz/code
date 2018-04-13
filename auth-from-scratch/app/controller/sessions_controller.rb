class SessionsController < ApplicationController

	get '/login' do
		erb :'sessions/login.html'
	end 

	post '/sessions' do
		# raise params.inspect-- the result is params[:email]
		#where do you want to put it-- sessions !
		# Change from: # session[:email] = params[:email]
		#change to: 
		login(params[:email], params[:password])
		#then, where do you want to go? 
		redirect '/posts'
	end 

	get '/logout' do 
		# session.clear # change to logout 
		logout!
		redirect '/posts'

	end 
end 