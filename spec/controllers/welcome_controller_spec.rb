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

  describe "GET instructions" do
    it "assigns 'instructions' as @page" do
      get :instructions
      assigns(:page).should eq('instructions')
    end
  end

  describe "GET view_app_status" do
    it "renders the status page" do
      get :view_app_status, {:params=>{:status=>1}}
      assert_template :status
      assigns(:error).should eq(false)
      assigns(:status).should eq(nil)
    end
  end

  describe "POST get_app_status" do
    before(:each) do
      @applicant = FactoryBot.create(:applicant)
    end

    it "should take a valid email and render the status page" do
      post :get_app_status,params: FactoryBot.attributes_for(:applicant), as: :json
      response.should redirect_to view_app_status_path({:status=>"Approved"})
    end

    it "should take an invalid email and render the status page" do
      post :get_app_status, {:params=>{:email=>"bob@gmail.com"}}
      response.should redirect_to view_app_status_path({:status=>nil})
    end
  end
end
