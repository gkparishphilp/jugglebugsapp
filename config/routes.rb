Rails.application.routes.draw do

	resources :admin, only: :index

	get '/export_media' => 'porter#export_media', as: 'export_media'
	post '/import_media' => 'porter#import_media', as: 'import_media'
	get '/upload_media' => 'porter#upload_media'

	get '/export_contacts' => 'porter#export_contacts', as: 'export_contacts'
	post '/import_contacts' => 'porter#import_contacts', as: 'import_contacts'
	get '/upload_contacts' => 'porter#upload_contacts'

	devise_scope :user do
        get '/login' => 'sessions#new', as: 'login'
        get '/logout' => 'sessions#destroy', as: 'logout'
    end
    devise_for :users, :controllers => { :sessions => 'sessions' }

    mount SwellMedia::Engine, :at => '/'
    
end

