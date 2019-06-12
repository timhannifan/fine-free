Rails.application.routes.draw do
	# root 'landing'
	# get '/', to: 'pages#landing'
	# match '/' => 'pages#landing', slug: ''
	root 'no_parking_zones#landing'
	get '/map', to: 'no_parking_zones#map'
  resources :no_parking_zones
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
