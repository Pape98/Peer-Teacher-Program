Rails.application.routes.draw do
	
# ------------ WELCOME CONTROLLER ----------- 
  root 'welcome#index'
  get '/rules', :to => 'welcome#rules'
  get '/people', :to => 'welcome#people'
  get '/login', :to => 'welcome#login'
  get '/confirm-account', :to => 'welcome#confirm'
  get '/instructions', :to => 'welcome#instructions'

# ------------ APPLICATION CONTROLLER ----------- 
  resources :applications
end
