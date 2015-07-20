class AddName < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, default: "", limit: 50
    add_column :users, :last_name, :string, null: false, default: "", limit: 50
  end
end
