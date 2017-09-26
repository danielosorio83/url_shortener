require 'rails_helper'

RSpec.describe 'Root', type: :request do
  describe "GET /" do
    it "returns success" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "matches with the `urls_path`" do
      get root_path
      expect(response.body).to match(urls_path)
    end
  end
end
