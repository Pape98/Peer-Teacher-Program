Rails.application.routes.draw do
	
# ------------ WELCOME CONTROLLER ----------- 

  root 'welcome#index'
  get '/rules', :to => 'welcome#rules'
  get '/people', :to => 'welcome#people'
  get '/confirm-account', :to => 'welcome#confirm'
  get '/instructions', :to => 'welcome#instructions'


  get '/login', :to => 'login#login_page'
  post '/loginUser', :to => 'login#login'
  get 'auth' => 'auth#index'

# ------------ APPLICATION CONTROLLER ----------- 
  resources :applications

# ------------ ADMINS CONTROLLER -----------
  get '/admin/home', :to => 'admins#home'
  get '/admin/view/applications', :to => 'admins#show_applications'

end
