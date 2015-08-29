class UrlsController < ActionController::Base

  def index
    @urls = Url.all
    render json: @urls.to_json(only: [:id, :url])
  end

end