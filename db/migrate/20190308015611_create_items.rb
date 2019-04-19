class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :artist
      t.string :album
      t.string :image_url
      t.string :genre
      t.string :condition
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
