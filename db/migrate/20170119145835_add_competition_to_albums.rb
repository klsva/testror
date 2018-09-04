class AddCompetitionToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :competition, :boolean, default: false #по умолчанию, альбомы не конкурсы
  end
end
