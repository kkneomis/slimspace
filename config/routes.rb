Rails.application.routes.draw do
  
  devise_for :users 
    
  resources :users do
    member do
      get "manage", to: "users#manage"
    end
  end


  post '/rate' => 'rater#create', :as => 'rate'
  
  resources :spaces

  resources :bookings, :only => [:index]
  #resources :desks, :only => [:destroy]
  

  
  resources :spaces do
    resources :desks do
      resources :bookings
    end
	end


  

  get 'bookings/booked'
  
  get 'static_pages/about'
  
  get 'static_pages/contact'

  root 'static_page#about'

end
