require 'AuthUtilities'

class AdminsController < ApplicationController

  include AuthUtilities

  before_action :set_applicants ,:authorize

  helper_method :get_download_links

  def set_applicants
    @applicants = Applicant.all
  end

  def home
    @applicants = Applicant.all.order('created_at DESC')
    @applicants_pending = Applicant.where(status:0)
    @applicants_approved = Applicant.where(status:1)
    @applicants_denied = Applicant.where(status:2)
    @applicants_incomplete = Applicant.where(status:3)
    make_tab_active 1
    render 'home'
  end


  def sort_and_filter
	sort = params[:sort] || session[:sort]

    case sort
    when 'first'
      ordering,@first_header = {:first_name => :asc}
    when 'last'
      ordering,@last_header = {:last_name => :asc}
    when 'gpa'
      ordering,@gpa_header = {:gpa => :desc}
    when 'date'
      ordering,@date_header = {:created_at => :desc}
    end

    @all_status = Applicant.all_status
    @selected_status = params[:status] || session[:status] || {}

    if @selected_status == {}
      @selected_status = Hash[@all_status.map {|status| [status, status]}]
    end

    if params[:sort] != session[:sort] or params[:status] != session[:status]
      session[:sort] = sort
      session[:status] = @selected_status
      #redirect_to :sort => sort, :status => @selected_status and return
    end

    @applicants = Applicant.where(status: @selected_status.keys).order(ordering)
  end

  def show_applications
    make_tab_active 2
 	  sort_and_filter 
    render 'applications'
  end

  def show_one_app
    @applicant = Applicant.find(params[:id])
    @csce_classes = DesiredClass.where("applicants_id = ?", params[:id]).select("csce_class")
    # add_download_links @applicant
    @color = update_status_color @applicant.status
    if(session[:redirected_by])
      flash[:success] = "Comment has successfully been updated."
    end
    render 'applicant'
    session[:status_change] = nil
    session[:redirected_by] = nil
  end

  def documents
    make_tab_active 3
    sort_and_filter
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
