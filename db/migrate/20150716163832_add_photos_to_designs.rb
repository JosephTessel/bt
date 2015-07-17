class AddPhotosToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :design_image, :string, null: false
  end
end
