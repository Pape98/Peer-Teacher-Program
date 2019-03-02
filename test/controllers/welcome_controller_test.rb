require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  Rspec.describe "GET index" do
    it "assigns index as @page" do
      get :index
      assigns(:page).should eq('index')
    end
  end

end
