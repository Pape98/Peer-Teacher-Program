require 'AuthUtilities'

class LoginController < ApplicationController
  include AuthUtilities


  skip_before_action :verify_authenticity_token



  #This is the login route a user takes
  def login
    begin
      user = authUserCreds params[:email], params[:password]
      session[:jwt] = generateJWT user
      # render plain:"sws"
      redirect_to :controller => 'admins', :action => 'home'

    rescue => error
      puts error
      flash[:alert] = 'Invalid credentials'
      redirect_to login_path
    end

  end



end
