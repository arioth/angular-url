class HomeController < ApplicationController

  def index
    gon.urls = Url.order('created_at DESC')
  end

end