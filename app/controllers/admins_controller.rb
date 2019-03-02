class AdminsController < ApplicationController
  def home
    render 'home'
  end

  def show_applications
    @applicants = Applicant.all.order(:first_name)
    render 'applications'
  end

  def show_one_app
    @applicant = Applicant.find(params[:id])
    render 'applicant'
  end

end
