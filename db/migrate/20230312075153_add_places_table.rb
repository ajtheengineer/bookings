class AddPlacesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :description, null: false
      t.string :image_src, null: false

      t.timestamps
    end
  end
end
