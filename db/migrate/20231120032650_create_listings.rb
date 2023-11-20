class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :sport_type
      t.text :description
      t.integer :hourly_price

      t.timestamps
    end
  end
end
