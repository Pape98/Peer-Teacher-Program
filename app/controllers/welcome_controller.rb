class WelcomeController < ApplicationController
  def index
    @page ='index'
  end

  def rules
    @page ='rules'
  end

  # def people
  #   @page ='people'
  # end

  def login
  end

  def instructions
    @page ='instructions'
  end

  def view_status
    render 'status'
    session[:success] = nil;
  end

end
