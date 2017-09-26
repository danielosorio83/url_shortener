class UrlsController < ApplicationController
  # POST /urls
  def create
    @url = Url.search(permitted_params)
  end

  # GET /:code
  def show
    @url = Url.find_by!(code: params[:code])
    redirect_to @url.original_url
  end

  private

  def permitted_params
    params.require(:url).permit(:original_url)
  end
end
