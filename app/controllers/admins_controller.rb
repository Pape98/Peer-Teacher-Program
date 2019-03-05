class AdminsController < ApplicationController

  before_action :set_applicants

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

end
