class AddProfilePictures < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :string, default: "app/assets/images/unnamed.png"
  end
end
