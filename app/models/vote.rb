class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  belongs_to :design
  validates :review, presence: true, uniqueness: { scope: :user }
  validates :vote, inclusion: { in: -1..1 }
end
