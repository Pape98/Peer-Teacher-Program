require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

  describe "GET documents" do
    it "renders the documents page" do
      get :documents
      assert_template :documents
    end
  end

  describe "GET settings" do
    it "renders the settings page" do
      get :settings
      assert_template :settings
    end
  end

  describe "Get show_one_app" do
    it "shows the selected application" do
      # applicant = FactoryBot.create(:applicant)
      # #expect { get :show_one_app, params: FactoryBot.attributes_for(:applicant), as: :json}.to change {:color}.from(nil).to(1)
      # #get :show_one_app, params: FactoryBot.attributes_for(:applicant), as: :json
      # #assigns(:color).should eq(applicant.status)
      # assert_template :applicant
      # expect(response).to redirect_to "/views/applicant"
    end
  end
end
