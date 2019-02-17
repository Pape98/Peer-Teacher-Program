class WelcomeController < ApplicationController
  def index
  end

  def rules
  	render 'rules'
  end

  def people
  	render 'people'
  end
end
