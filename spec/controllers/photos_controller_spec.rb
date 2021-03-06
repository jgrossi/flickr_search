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

    it "renders the search template for empty query" do
      get :search, params: { q: "" }
      expect(response).to render_template(:search)
    end
  end

  describe "POST #create" do
    let(:params) { { photo: FactoryGirl.attributes_for(:photo) } }
    it "is an AJAX request" do
      post :create, xhr: true, params: params
      expect(response).to have_http_status(:success)
    end

    it "saves a new photo in the database" do
      expect{ post :create, xhr: true, params: params }.to change(Photo, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    let(:params) { { photo: FactoryGirl.attributes_for(:photo) } }
    it "removes a photo record from the database" do
      expect { post :create, xhr: true, params: params }.to change(Photo, :count).by(1)
    end
  end
end
