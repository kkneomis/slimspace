Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  class CustomDomainConstraint
    # Implement the .matches? method and pass in the request object
    def self.matches? request
      matching_site?(request)
    end

    def self.matching_site? request
      # handle the case of the user's domain being either www. or a root domain with one query
      if request.subdomain == 'www'
        req = request.host[4..-1]
      else
        req = request.host
      end

      # first test if there exists a Site with a domain which matches the request,
      # if not, check the subdomain. If none are found, the the 'match' will not match anything
      # Site.where(:domain => req).any? || Site.where(:slug => request.subdomain).any?
      User.where(:site_slug => request.subdomain).any?
    end
  end

  match '/', :to => 'site_spaces#index', :constraints => CustomDomainConstraint, via: :all

  get 'site_spaces/index'

  get 'site_spaces/new'

  get 'site_spaces/show'

  get 'site_spaces/create'

  get 'site_spaces/update'

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
      resources :photos
	end

  resources :contacts, only: [:new, :create, :sendMessage]

  get 'bookings/booked'

  get 'static_page/about'
  
  get 'static_page/contact'

  root 'static_page#about'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  #root 'spaces#index'

end
