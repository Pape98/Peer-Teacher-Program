require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe 'GET login' do
    it 'redirects to the login page' do
      get :login
      expect(response).to redirect_to(login_path)
    end
  end

end
