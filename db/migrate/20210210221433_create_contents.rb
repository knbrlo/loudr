class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :content_category
      t.string :content_type
      t.string :content_name
      t.string :content_duration
      t.integer :content_order
      t.boolean :content_explicit

      t.timestamps
    end
  end
end
