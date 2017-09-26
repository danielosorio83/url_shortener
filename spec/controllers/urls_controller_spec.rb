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

    it 'calls `Url.search`' do
      expect(Url).to receive(:search).with(kind_of(ActionController::Parameters))
      post :create, params: valid_params, xhr: true
    end
  end
end
