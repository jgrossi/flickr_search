require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  describe "GET #search" do
    it "returns http success" do
      get :search, params: { q: 'dog' }
      expect(response).to have_http_status(:success)
    end

    it "renders the search template" do
      get :search, params: { q: 'dog' }
      expect(response).to render_template(:search)
    end
  end
end
