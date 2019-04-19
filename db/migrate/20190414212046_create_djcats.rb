class CreateDjcats < ActiveRecord::Migration[5.2]
  def change
    create_table :djcats do |t|
      t.string :artist
      t.string :album
      t.string :genre
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
