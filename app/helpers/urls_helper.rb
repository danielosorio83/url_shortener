module UrlsHelper
  def alert_class(url)
    url.errors.any? ? 'danger' : 'success'
  end
end
