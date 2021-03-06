Rails.application.routes.draw do

	resources :admin, only: :index

	devise_scope :user do
        get '/login' => 'sessions#new', as: 'login'
        get '/logout' => 'sessions#destroy', as: 'logout'
    end
    devise_for :users, :controllers => { :sessions => 'sessions' }

    mount SwellMedia::Engine, :at => '/'
    
end

