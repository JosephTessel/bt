class SubmitDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.belongs_to :user
      t.string :design_name, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
