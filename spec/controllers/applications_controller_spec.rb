require 'rails_helper'
require 'AuthUtilities'

RSpec.configure do |c|
  c.include AuthUtilities
end

RSpec.describe ApplicationsController, type: :controller do

  describe "GET index" do
    it "renders the index view for the admin" do
      FactoryBot.create(:applicant)
      get :index
      expect(:applicants).to_not eq(nil)
    end
  end

  describe "GET new" do
    it "creates a new application" do
      get :new
      expect(:applicant).to_not eq(nil)
    end
  end

  describe 'POST create' do
    it "creates applicant" do
      expect { post :create, params: FactoryBot.attributes_for(:applicant), as: :json,
        :params=>{:csce_class=>["CSCE-121", "CSCE-313"],
          :resume=>"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing",
          :transcript=>"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing",
          :schedule=>"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing"
          } }.to change(Applicant, :count).by(1)
      expect(response).to redirect_to "/view/app-status"
    end

    it "adds the desired classes" do
      expect { post :create, params: FactoryBot.attributes_for(:applicant), as: :json,
        :params=>{:csce_class=>["CSCE-121", "CSCE-313"],
          :resume=>"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing",
          :transcript=>"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing",
          :schedule=>"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing"
          } }.to change(DesiredClass, :count).by(2)
      expect(response).to redirect_to "/view/app-status"
    end
 end

 describe 'DELETE destroy' do
   it "deletes an applicant" do
     applicant = FactoryBot.create(:applicant)
     expect { delete :destroy,params: FactoryBot.attributes_for(:applicant), as: :json}.to change(Applicant, :count).by(-1)
     expect(response).to redirect_to "/admin/applications"
   end
 end


 # describe 'GET change_status' do
 #   before(:each) do
 #     user = User.new(
 #       email: "jsmith@tamu.edu",
 #       password: "abc",
 #       password_confirmation: "acbc",
 #       first_name: "John",
 #       last_name: "Smith")
 #     @request.session[:jwt] = generateJWT(user)
 #     @request.session[:current_user] = user.first_name
 #   end
 #   it "changes the status of an applicant (pending)" do
 #     # controller.request.should_receive(:referrer).and_return("/admin/applications")
 #     #controller.request.stub referer: "/admin/applications"
 #     #allow(controller.request).to receive(:referrer).and_return("/admin/applications")
 #     @applicant1 = FactoryBot.create(:applicant)
 #     get :change_status, {:params=>{:id=>@applicant1.id, :code=>"pending"}}
 #     expect(:applicant.status).to eq(0)
 #     referrer = request.referrer ? request.referrer : '/'
 #     redirect_to referrer, :alert => error_message
 #   end
 # end

end
