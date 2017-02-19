class Photo < ApplicationRecord
  def self.search(query, size = 't')
    list = flickr.photos.search(text: query)
    list.map do |p|
      "https://farm#{p.farm}.staticflickr.com/#{p.server}/#{p.id}_#{p.secret}_#{size}.jpg"
    end
  end
end
