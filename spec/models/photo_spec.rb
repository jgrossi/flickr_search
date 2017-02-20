require 'rails_helper'

RSpec.describe Photo, type: :model do
  context 'search for dog' do
    it 'returns more than one result'
    it 'returns a hash with the flickr results'
    it 'has at least farm, server, id and secret fields'    
  end

  context 'image_src' do
    it 'renders the a squared thumbnail passing the flickr hash'
  end

  context 'add image to library' do
    it 'cannot be valid without a farm field'
    it 'cannot be valid without a server field'
    it 'cannot be valid without a flickr_id field'
    it 'cannot be valid without a secret field'
    it 'is valid with farm, server, flickr_id and secret fields'
  end

  it 'can return a hash with all fields to be used by the image_src method'
end
