Rails.application.routes.draw do
	# admin area
	get "/admin/" => "admin/objects#index"

	match "/admin/logon/", to: 'admin/sessions#logon', via: [:get, :post]

	match "/admin/logout/", to: 'admin/sessions#logout', via: [:get, :post]

	namespace :admin do
		resources :objects
	end
	namespace :admin do
		resources :photos
	end
	namespace :admin do
		resources :albums
	end
	namespace :admin do
		resources :reviews
	end
	namespace :admin do
		resources :slides
	end
	namespace :admin do
		resources :services
	end
	namespace :admin do
		resources :videos
	end
	namespace :admin do
		resources :objects_types
	end
	namespace :admin do
		resources :navigations
	end
	namespace :admin do
		resources :sessions
	end
	namespace :admin do
		resources :users
	end
	namespace :admin do
		resources :clients
	end

	resources :reviews

	get '/services/:id', to: 'services#view', as: 'service'

	get '/photos/:id', to: 'photos#view', as: 'photo'

	get '/photos', to: 'photos#index'
	
	get '/videos/:id', to: 'videos#view', as: 'video'

	get '/videos', to: 'videos#index'

	post'sendmail' , to: 'pages#sendmail', defaults: { format: 'json' }
	

	get ':controller(/:action(/:id))'

	get '*not_found', to: 'application#not_found'
	
end
