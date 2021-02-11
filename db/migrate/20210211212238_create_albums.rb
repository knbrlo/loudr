class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :category
      t.string :release_date

      t.timestamps
    end
  end
end
