class PhotosController < ApplicationController
  def index
    @photo = Photo.new
  end

  def search
    @photos = Photo.search(params[:q])
    @photo = Photo.new
  end
end
