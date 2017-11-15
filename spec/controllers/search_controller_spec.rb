require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #cep" do
    it "returns http success" do
      get :cep
      expect(response).to have_http_status(:success)
    end
  end

end
