Rails.application.routes.draw do
	
# ------------ WELCOME CONTROLLER ----------- 

  root 'welcome#index'
  get '/rules', :to => 'welcome#rules'
  get '/people', :to => 'welcome#people'
  get '/confirm-account', :to => 'welcome#confirm'
  get '/instructions', :to => 'welcome#instructions'
  get '/view/app-status', :to => 'welcome#view_app_status'
  post'/view/app-status', :to => 'welcome#get_app_status'

  # ------------ LOGIN CONTROLLER -----------
  get '/login', :to => 'login#login_page'
  post '/loginUser', :to => 'login#login'

  # ------------ AUTH CONTROLLER -------------
  get 'auth' => 'auth#index'

# ------------ APPLICATION CONTROLLER ----------- 
  resources :applications
  get '/admin/applications/:id/:code', :to => 'applications#change_status'

# ------------ ADMINS CONTROLLER -----------
  get '/admin/home', :to => 'admins#home'
  get '/admin/applications', :to => 'admins#show_applications'
  get '/admin/applications/:id', :to => 'admins#show_one_app'
  get '/admin/documents', :to => 'admins#documents'
  get '/admin/settings', :to => 'admins#settings'


  post '/addAdmin', :to => 'admins#add_admin'
  post '/deleteAdmin', :to => 'admins#delete_admin'
  post '/changePassword', :to => 'admins#change_password'


end
