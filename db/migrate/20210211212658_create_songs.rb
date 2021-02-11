class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :duration
      t.integer :song_number
      t.boolean :explicit
      t.integer :play_count
      t.belongs_to :album

      t.timestamps
    end
  end
end
