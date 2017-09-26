require 'rails_helper'

RSpec.describe 'Urls', type: :request do
  describe "POST /create" do
    context 'with valid params' do
      let(:valid_params) { { url: { original_url: Faker::Internet.unique.url } } }

      it "returns success" do
        post urls_path, params: valid_params, xhr: true
        expect(response).to have_http_status(200)
      end

      it "renders the create template" do
        post urls_path, params: valid_params, xhr: true
        expect(response).to render_template(:create)
      end

      it "matches `alert.addClass(\"alert-success\");`" do
        post urls_path, params: valid_params, xhr: true
        expect(response.body).to include('alert.addClass("alert-success")')
      end

      it "matches code_url with the url code" do
        post urls_path, params: valid_params, xhr: true
        expect(response.body).to include(code_url(code: Url.last.code))
      end
    end
  end
end
