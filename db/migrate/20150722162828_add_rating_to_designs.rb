class AddRatingToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :rating, :decimal, default: 0
  end
end
