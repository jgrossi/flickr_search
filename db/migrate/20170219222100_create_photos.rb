class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :farm
      t.integer :server
      t.string :flickr_id
      t.string :secret
      t.string :url

      t.timestamps
    end
  end
end
