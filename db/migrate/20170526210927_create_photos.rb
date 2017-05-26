class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
            t.caption :place_id 
            t.caption :photo_id
      t.timestamps
    end
  end
end
