class RemoveReviewIdFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :review_id, :integer
  end
end
