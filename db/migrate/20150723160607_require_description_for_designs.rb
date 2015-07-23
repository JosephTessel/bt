class RequireDescriptionForDesigns < ActiveRecord::Migration
  def change
    change_column :designs, :description, :string, null: false
  end
end
