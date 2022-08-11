class AddHandleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :handle, :string, null: false
    add_index :users, :handle, unique: true
  end
end
