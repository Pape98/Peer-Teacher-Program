class WelcomeController < ApplicationController
  def index
    @page ='index'
  end

  def rules
    @page ='rules'
  end

  def instructions
    @page ='instructions'
  end

  def view_app_status
    @page ='status'
    @status = params[:status]
    @comment = params[:comment]
    if @status == nil && flash[:redirect_by] == 'get_app_status'
      @error = true
    end
    render 'status'
    @error = false
    session[:success] = nil
    @status = nil
    flash[:redirect_by] = nil
  end

  def get_app_status
    applicant = Applicant.where(email:params[:email]).ids
    flash[:redirect_by] = 'get_app_status'
    if applicant.size == 0
      redirect_to url_for(:controller => 'welcome', :action => 'view_app_status', :status => nil)
    else
      application = Applicant.find_by id:applicant
      status = application.status
      comment = application.admin_comment
      redirect_to url_for(:controller => 'welcome', :action => 'view_app_status', :status => status , :comment => comment)
    end
  end

end
