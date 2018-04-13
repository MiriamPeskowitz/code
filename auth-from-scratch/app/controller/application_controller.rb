class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "auth_demo"
	end 

	get '/' do
	# 	session[:greeting] = "hello world"
		
		 erb :'sessions/login'	 
	end

	# get '/remember' do
	# 	session[:greeting]
	# end 

	# get '/' do
	# 	"hello world"
	# end 

	helpers do 
		#we maintain state with this method -- 
		def logged_in?
			# !!session[:email]
			!!current_user
		end 


		def current_user
			@current_user ||= user.find_by(:email => session[:email]) if session[:email]
		end

		def login(email, password)
			#is the user who they claim to be? 
			user = User.find_by_email(:email => email)
			if user && user.authenticate(password) 
				session[:email] = user.email
				#if -statement assignment, pattern -- creates local variable 
			else 
				redirect '/login'
			end
			# session[:email] = email 
		end 

		def logout! 
			session.clear
			redirect to "/login"
		end
	end 
end
#login(params[:email])
#making something true, double bang !!, takes object, converts it into binary value of true or false 
# class Object
# 	def true?
# 		!!self
# 	end 
# end

