Rails.application.routes.draw do
  root "emails#index"

  # resource :email_processor, only: [:create, :new]
  post '/email_processor' => 'griddler/emails#create'
end
