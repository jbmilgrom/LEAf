Rails.application.routes.draw do
  root "posts#index"

  # resource :email_processor, only: [:create, :new]
  post '/email_processor' => 'griddler/emails#create'
end
