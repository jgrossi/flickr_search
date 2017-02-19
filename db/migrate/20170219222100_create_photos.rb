class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :flickr_id
      t.string :url

      t.timestamps
    end
  end
end
