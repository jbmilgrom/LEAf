Rails.application.routes.draw do
  root "posts#index"

# post '/email_processor' is the SendGrid spec route
# 'griddler/emails#create' triggers the Griddler gem from processing
  post '/email_processor' => 'griddler/emails#create'
end
