class CreateSingles < ActiveRecord::Migration[6.1]
  def change
    create_table :singles do |t|
      t.string :name
      t.string :duration
      t.string :category
      t.boolean :released
      t.string :release_date
      t.integer :play_count

      t.timestamps
    end
  end
end
