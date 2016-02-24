require 'rails_helper'

RSpec.describe EmberController, type: :controller do

  describe "GET #bootstrap" do
    it "returns http success" do
      get :bootstrap
      expect(response).to have_http_status(:success)
    end
  end

end
