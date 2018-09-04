class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :file
      t.float :ave_value
      t.integer :album_id

      t.timestamps
    end
  end
end
