require 'rails_helper'
require 'AuthUtilities'

RSpec.configure do |c|
  c.include AuthUtilities
end

RSpec.describe AdminsController, type: :controller do

  before(:each) do
    user = User.new(
      email: "jsmith@tamu.edu",
      password: "abc",
      password_confirmation: "acbc",
      first_name: "John",
      last_name: "Smith")
    @request.session[:jwt] = generateJWT(user)
    @request.session[:current_user] = user.first_name
  end

  describe "set_applicants" do
    it "loads the applicants from the model" do
      applicant = FactoryBot.create(:applicant)
      expect(:applicants).to_not eq(nil)
    end
  end

  describe "GET home" do
    it "renders the home page" do
      get :home
      assert_template :home
    end
  end

  describe "GET show_applications" do
    it "renders applicants sorted by first name" do
      @request.session[:sort] = 'first'
      get :show_applications
      applicant = FactoryBot.create(:applicant)
      expect(:applicants).to_not eq(nil)
      assert_template :applications
    end

    it "renders applicants sorted by first name" do
      @request.session[:sort] = 'last'
      get :show_applications
      applicant = FactoryBot.create(:applicant)
      expect(:applicants).to_not eq(nil)
      assert_template :applications
    end

    it "renders applicants sorted by first name" do
      @request.session[:sort] = 'gpa'
      get :show_applications
      applicant = FactoryBot.create(:applicant)
      expect(:applicants).to_not eq(nil)
      assert_template :applications
    end

  end

  describe "GET show_one_app" do
    it "shows the selected application" do
      applicant = FactoryBot.create(:applicant)
      get :show_one_app, {:params=>{:id=>applicant.id}}
      assigns(:color).should eq("green")
      assert_template :applicant
    end
  end

  describe "GET documents" do
    it "renders the documents page" do
      get :documents
      assert_template :documents
    end
  end

  describe "GET settings" do
    it "renders the settings page" do
      get :settings
      expect(:users.size).to_not eq(nil)
      assert_template :settings
    end
  end

  describe "make_tab_active" do
    it "it activates different tabs" do
      @controller.make_tab_active(1)
      assigns(:active).should eq("home")

      @controller.make_tab_active(2)
      assigns(:active).should eq("show_app")

      @controller.make_tab_active(3)
      assigns(:active).should eq("documents")

      @controller.make_tab_active(4)
      assigns(:active).should eq("settings")
    end
  end

  describe "update_status_color" do
    it "returns color based on status" do
      expect(@controller.update_status_color("Pending")).to eq("yellow")

      expect(@controller.update_status_color("Approved")).to eq("green")

      expect(@controller.update_status_color("Denied")).to eq("red")

      expect(@controller.update_status_color("Incomplete")).to eq("orange")
    end
  end

  describe "get_download_links" do
    it 'gets the google drive links' do
      url = "https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/preview?usp=sharing"
      new_url = 'https://drive.google.com/uc?export=download&id=' + '1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr'
      expect(subject.get_download_links(url)).to eq(new_url)
    end
  end

  describe "POST add_admin" do
    it 'adds a user to the database' do
      expect{post :add_admin, {:params=>{
        :email=>"bobsmith@tamu.edu",
        :password=>"123",
        :password_confirmation=>"123",
        :first_name=>"Bob",
        :last_name=>"Smith"
        }}}.to change(User, :count).by(1)
    end
  end

  describe "POST delete_admin" do
    it "deletes an admin" do
      admin = User.create!(
        :email=>"bobsmith@tamu.edu",
        :password_digest=>"498$55%%",
        :first_name=>"Bob",
        :last_name=>"Smith"
      )
      expect{post :delete_admin, {:params=>{:id=>admin.id}}}.to change(User, :count).by(-1)
    end
  end

  describe "POST change_password" do
    it "changes the users password" do
      newUser = User.new(email: "jsmith@tamu.edu", password: "abc", password_confirmation: "abc", first_name: "John", last_name: "Smith")
      newUser.save
      old_password_digest = newUser.password_digest
      post :change_password, params: {
          :current_password=>"abc",
          :new_password=>"hello",
          :confirm_new_password=>"hello",
        }
      expect(User.find_by(email: "jsmith@tamu.edu").password_digest).to_not eq(old_password_digest)
      expect(flash[:alert]).to be_present
    end


    it "does not change the user\'s password with an invalid login" do
      newUser = User.new(email: "jsmith@tamu.edu", password: "abc", password_confirmation: "abc", first_name: "John", last_name: "Smith")
      newUser.save
      old_password_digest = newUser.password_digest
      post :change_password, params: {
          :current_password=>"123",
          :new_password=>"hello",
          :confirm_new_password=>"hello",
        }
      expect(User.find_by(email: "jsmith@tamu.edu").password_digest).to eq(old_password_digest)
      expect(flash[:alert]).to be_present
    end
  end

end
