Rails.application.routes.draw do
  
  devise_for :users 
    
  resources :users do
    member do
      get "manage", to: "users#manage"
    end
  end


  post '/rate' => 'rater#create', :as => 'rate'
  
  resources :spaces
  #get '/spaces/new/:parent' => 'space#new'
  
     resources :bookings, :only => [:index, :approve] do
        member do
          put "confirm", to: "bookings#approve"
        end
      end
  
  resources :spaces do
      resources :bookings
	end

  

  

  get 'bookings/booked'
  
  get 'static_pages/about'
  
  get 'static_pages/contact'

  root 'static_page#about'

end
