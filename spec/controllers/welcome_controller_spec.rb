require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do
    it "assigns 'index' as @page" do
      get :index
      assigns(:page).should eq('index')
    end
  end

  describe "GET rules" do
    it "assigns 'rules' as @page" do
      get :rules
      assigns(:page).should eq('rules')
    end
  end

  describe "GET people" do
    it "assigns 'people' as @page" do
      get :people
      assigns(:page).should eq('people')
    end
  end

  describe "GET instructions" do
    it "assigns 'instructions' as @page" do
      get :instructions
      assigns(:page).should eq('instructions')
    end
  end


end
