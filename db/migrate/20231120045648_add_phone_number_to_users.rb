class AddPhoneNumberToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :phone_number, :integer
  end

  def down
    remove_column :users, :phone_number
  end
end
