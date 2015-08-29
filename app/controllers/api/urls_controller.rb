class Api::UrlsController < Api::BaseController

  def index
    @urls = Url.order('created_at DESC')
    render json: @urls.to_json(only: [:id, :url])
  end

  def create
    @url = Url.new url_params
    if @url.save
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

private

  def url_params
    params.permit(:url)
  end

end