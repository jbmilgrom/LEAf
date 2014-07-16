Rails.application.routes.draw do
  # root "posts#index"
  root "saved_articles#index"

  # just for testing.  DELETE WHEN FINISHED
  resources :posts, only: :index

	# post '/email_processor' is the SendGrid spec route
	# 'griddler/emails#create' triggers the Griddler gem from processing
  post '/email_processor' => 'griddler/emails#create'

  resources :users, except: :new do 
  	resources :saved_articles, shallow: true
  end

  get "/sign_up" => "users#new", :as => "sign_up"
  
  get "/log_out" => "sessions#destroy", :as => "log_out"
  get "/log_in" => "sessions#new", :as => "log_in"
  resources :sessions, only: :create

end
