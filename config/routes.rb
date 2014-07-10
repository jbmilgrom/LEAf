Rails.application.routes.draw do
  root "emails#index"

  resource :email_processor, only: :create
end
