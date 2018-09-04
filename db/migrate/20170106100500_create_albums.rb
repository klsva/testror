class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.references :user, foreign_key: true
      t.text :album_description

      t.timestamps
    end
    add_index :albums, [:user_id, :created_at], unique: true #чтобы получить альбомы в обратном порядке от их создания
  end
end