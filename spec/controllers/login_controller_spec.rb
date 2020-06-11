require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe 'GET login' do
    it 'redirects to the login page' do
      get :login
      expect(response).to redirect_to(login_path)
    end
  end

  describe "POST login" do
    it 'logs a valid user in' do
      newUser = User.new(email: "jsmith@tamu.edu", password: "abc", password_confirmation: "abc", first_name: "John", last_name: "Smith")
      newUser.save
      post :login, :params=>{:email=>"jsmith@tamu.edu", :password=>"abc"}
      expect(response).to redirect_to(loading_path)
      expect(flash[:alert]).to_not be_present
    end

    it 'does not log an invalid user in' do
      post :login, :params=>{:email=>"jsmith@tamu.edu", :password=>"hello123"}
      expect(response).to redirect_to(login_path)
      assert_equal flash[:alert], 'Invalid credentials'
    end
  end

  describe "POST reset" do
    it 'resets a given user\'s password' do
      newUser = User.new(email: "jsmith@tamu.edu", password: "abc", password_confirmation: "abc", first_name: "John", last_name: "Smith")
      newUser.save
      old_password_digest = newUser.password_digest
      post :reset, :params=>{:email=>newUser.email}
      expect(User.find_by(email: "jsmith@tamu.edu").password_digest).to_not eq(old_password_digest)
      expect(response).to redirect_to(login_path)
    end
  end
end
