class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false
      t.belongs_to :design, null: false
      t.integer :rating, null: false
      t.text :body, null: false, limit: 250

      t.timestamps null: false
    end
  end
end
