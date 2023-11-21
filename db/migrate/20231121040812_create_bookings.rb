class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.integer :accepted, default: 0, null: false
      t.string :total_price

      t.timestamps
    end
  end
end
