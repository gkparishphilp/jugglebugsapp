Rails.application.routes.draw do

	concern :admin do
		get 	:admin, 	on: :collection
		get		:adminit,	on: :member
	end

	resources :contacts, concerns: :admin

	resources :optins, concerns: :admin, only: :create


	devise_scope :user do
        get '/login' => 'sessions#new', as: 'login'
        get '/logout' => 'sessions#destroy', as: 'logout'
    end
    devise_for :users, :controllers => { :sessions => 'sessions' }

    mount SwellMedia::Engine, :at => '/'
    
end

