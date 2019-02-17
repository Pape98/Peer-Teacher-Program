Rails.application.routes.draw do
	
# ------------ WELCOME CONTROLLER ----------- 
  root 'welcome#index'
  get '/rules', :to => 'welcome#rules'
  get '/people', :to => 'welcome#people'
end
