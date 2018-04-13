flatiron_labs

get '/', to: "welcome#home"

get '/songs/:id', to: 'songs#show'
	will not have a prefix
get '/songs/:id', to: 'songs#show', as: "song"
	will get it a prefix
	song_path(song)
	link_to song_path(1)

resources :song -- will give all the restful routes, per convention 
 draws the routes and does the ,as: naming



pros and cons of using resources
	get more than you asked for... 
	use :only []

	

ar-demo
