require 'rails_helper'

RSpec.describe Photo, type: :model do
  context 'search for dog' do
    let(:results) { Photo.search('dog') }
    it 'returns more than one result' do
      expect(results.size).to be >= 1
    end

    it 'returns a FlickRaw::ResponseList with the flickr results' do
      expect(results).to be_instance_of FlickRaw::ResponseList
    end

    it 'has at least farm, server, id and secret fields' do
      expect(results[0].farm).to be_truthy
      expect(results[0].server).to be_truthy
      expect(results[0].id).to be_truthy
      expect(results[0].secret).to be_truthy
    end
  end

  context 'thumbnail src' do
    let(:results) { Photo.search('cat') }
    it 'renders the a squared thumbnail passing the flickr hash' do
      expect(Photo.thumbnail(results[0])).to start_with('https')
    end
  end

  context 'add image to library' do
    let(:saved_photo) { Photo.create(farm: 3, server: 22, flickr_id: '32884678381', secret: '17ccf83780') }
    it 'cannot be valid without a farm field' do
      expect(Photo.new.valid?).to be_falsey
    end

    it 'cannot be valid without a server field' do
      expect(Photo.create(farm: 3).valid?).to be_falsey
    end

    it 'cannot be valid without a flickr_id field' do
      expect(Photo.create(farm: 3, server: 22).valid?).to be_falsey  
    end

    it 'cannot be valid without a secret field' do
      expect(Photo.create(farm: 3, server: 22, flickr_id: '32884678381').valid?).to be_falsey   
    end

    it 'is valid with farm, server, flickr_id and secret fields' do
      expect(saved_photo.valid?).to be_truthy   
    end

    it 'stores the image url according the received hash' do
      expect(saved_photo.url).to start_with('https')
    end
  end
end
