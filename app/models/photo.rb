class Photo < ApplicationRecord
  def self.search(query, size = 'q')
    list = flickr.photos.getRecent(text: query)
    list.map do |p|
      "https://farm#{p.farm}.staticflickr.com/#{p.server}/#{p.id}_#{p.secret}_#{size}.jpg"
    end
  end
end
