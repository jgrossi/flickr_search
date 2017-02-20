class PhotosController < ApplicationController
  def index
    @photo = Photo.new
  end

  def search
    @photos = Photo.search(params[:q])
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    render 'create.js.erb' if @photo.save
  end

  def gallery
    @photos = Photo.all
  end

  def destroy
    @photo = Photo.find(params[:id])
    render 'destroy.js.erb' if @photo.destroy
  end

  private
  def photo_params
    params.require(:photo).permit(:farm, :server, :flickr_id, :secret)
  end
end
