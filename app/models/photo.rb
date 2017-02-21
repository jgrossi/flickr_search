require 'ostruct'

class Photo < ApplicationRecord
  before_create :build_url
  validates :farm, presence: true, numericality: { only_integer: true }
  validates :server, presence: true, numericality: { only_integer: true }
  validates :flickr_id, presence: true
  validates :secret, presence: true

  def self.search(query)
    flickr.photos.search(text: query)
  end

  def build_url
    photo = self.dup
    photo.id = photo.flickr_id
    object = OpenStruct.new(photo.attributes)
    self.url = FlickRaw.url_q(object)
  end
end
