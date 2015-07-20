class AddMaximumLength < ActiveRecord::Migration
  def change
    change_column :users, :first_name, :string, null: false, default: "", maximum: 50
    change_column :users, :last_name, :string, null: false, default: "", maximum: 50
    change_column :users, :email, :string, null: false, default: "", maximum: 50
  end
end
