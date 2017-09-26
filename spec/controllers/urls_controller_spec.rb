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

  describe "GET #show" do
    context 'when `code` is valid' do
      let(:url) { create(:url) }

      it "redirects to `original_url`" do
        get :show, params: { code: url.code }
        expect(response).to redirect_to(url.original_url)
      end
    end

    context 'when `code` is invalid' do
      it "redirects to `original_url`" do
        get :show, params: { code: 'error' }
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
