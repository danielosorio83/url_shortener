require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe "POST #create" do
    let(:valid_params) { { url: { original_url: Faker::Internet.unique.url } } }

    it "returns http success" do
      post :create, params: valid_params, xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'assigns @url' do
      post :create, params: valid_params, xhr: true
      expect(assigns(:url)).to be_kind_of(Url)
    end

    it 'calls `Url.find_or_create_by`' do
      expect(Url).to receive(:find_or_create_by).with(kind_of(ActionController::Parameters))
      post :create, params: valid_params, xhr: true
    end
  end
end
