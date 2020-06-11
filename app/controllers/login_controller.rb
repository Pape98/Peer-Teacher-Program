require 'AuthUtilities'
require 'securerandom'

class LoginController < ApplicationController
  include AuthUtilities


  skip_before_action :verify_authenticity_token



  #This is the login route a user takes
  def login
    begin
      user = authUserCreds params[:email], params[:password]
      session[:jwt] = generateJWT user
      user = User.find_by(email: params[:email])
      session[:current_user] = user.first_name
      # render plain:"sws"
      redirect_to :controller => 'login', :action => 'loader'
    rescue => error
      puts error
      flash[:alert] = 'Invalid credentials'
      flash[:message] = 'The email or password you’ve entered is incorrect.'
      redirect_to login_path
    end

  end

  def loader

  end

  def reset
    user = User.find_by(email: params[:email])

    if (user.nil?)
      flash[:alert] = 'The email you entered could not be found!'
      flash[:message] = 'Please try again.'
      redirect_to '/resetPassword'
      return
    end

    newPassword = SecureRandom.base64 10
    user.password = newPassword
    user.password_confirmation = newPassword
    user.save

    UserNotifierMailer.send_reset_email(user.email, newPassword).deliver
    flash[:notice] = 'Your new password has been sent!'
    redirect_to '/login'
  end

  def signout
    reset_session
    redirect_to '/'
  end


end
