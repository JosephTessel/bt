class LinkVotesToDesignIds < ActiveRecord::Migration
  def change
    add_column :votes, :design_id, :integer, null: false
  end
end
