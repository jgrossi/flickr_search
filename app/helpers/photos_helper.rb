module PhotosHelper
  def photo_in_gallery?(id)
    !Photo.where(flickr_id: id).blank?
  end

  def photo_thumbnail(photo)
    FlickRaw::url_q(photo)
  end
end
