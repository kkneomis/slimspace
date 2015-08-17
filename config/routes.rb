Rails.application.routes.draw do
  
  
  resources :spaces


  
  resources :spaces do
    resources :desks do
	    resources :bookings
    end
	end

  devise_for :users
  

  
  get 'bookings/booked'
  
  get 'static_pages/about'
  
  get 'static_pages/contact'

  root 'static_page#about'

end
