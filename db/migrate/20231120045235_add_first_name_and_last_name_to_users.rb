class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end

  def down
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
