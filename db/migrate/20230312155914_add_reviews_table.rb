class AddReviewsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :display_name, null: false 
      t.string :comment, null: false
      t.integer :rating, null: false
      t.references(
        :place,
        null: false,
        foreign_key: true
      )

      t.timestamps
    end
  end
end
