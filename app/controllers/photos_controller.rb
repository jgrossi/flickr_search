class PhotosController < ApplicationController
  def index
  end

  def search
    @photos = Photo.search(params[:q])
  end
end
