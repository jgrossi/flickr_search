class Photo < ApplicationRecord
  def self.search(query)
    list = flickr.photos.search(text: query)
    list.map { |photo| FlickRaw::url_q(photo) }
  end
end
