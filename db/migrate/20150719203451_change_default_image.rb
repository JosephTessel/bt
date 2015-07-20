class ChangeDefaultImage < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo, :string, default: "app/assets/images/unnamed.png"
    add_column :users, :profile_photo, :string
  end
end