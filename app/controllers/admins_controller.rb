require 'AuthUtilities'

class AdminsController < ApplicationController

  include AuthUtilities

  before_action :set_applicants
  helper_method :get_download_links

  def set_applicants
    @applicants = Applicant.all
  end

  def home
    make_tab_active 1
    render 'home'
  end

  def show_applications
    make_tab_active 2
    @applicants = Applicant.all.order(:first_name)
    render 'applications'
  end

  def show_one_app
    @applicant = Applicant.find(params[:id])
    @color = update_status_color @applicant.status
    render 'applicant'
    session[:status_change] = nil
  end

  def documents
    make_tab_active 3
    render 'documents'
  end

  def settings
    @users = User.all
    make_tab_active 4
    render 'settings'
  end

  def make_tab_active num
    case num
    when 1
      @active = 'home'
    when 2
      @active = 'show_app'
    when 3
      @active = 'documents'
    when 4
      @active = 'settings'
    end
  end

  def update_status_color status
    case status
    when 'Pending'
      return'yellow'
    when 'Approved'
      return 'green'
    when 'Denied'
      return 'red'
    when 'Incomplete'
      return 'orange'
    end
  end

  def get_download_links url
    index_start = url.index('d/') + 2
    index_end = url.index('/preview') - 1
    id = url[index_start..index_end]
    new_url = 'https://drive.google.com/uc?export=download&id=' + id
  end


  skip_before_action :verify_authenticity_token

  def add_admin
    newUser = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirm], first_name: params[:first_name], last_name: params[:last_name])
    newUser.save
    settings
  end

  def delete_admin
    User.delete params[:id]
    settings
  end



  def change_password
    token = decodeJWT session[:jwt]
    currUser = User.find_by(email: token["email"])

    if currUser && currUser.authenticate(params[:current_password]) 

      currUser.password = params[:new_password]
      currUser.password_confirmation = params[:confirm_new_password]
      currUser.save
      flash[:alert] = 'Password changed'
      
    else
      flash[:alert] = 'Unable to change password'
    end

    settings
  end




end
