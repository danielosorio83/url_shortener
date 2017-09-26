class UrlsController < ApplicationController
  # POST /urls
  def create
    @url = Url.search(permitted_params)
  end

  private

  def permitted_params
    params.require(:url).permit(:original_url)
  end
end
