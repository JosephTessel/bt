class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :design
  has_many :votes

  validates :body, presence: true
  validates :user, presence: true
  validates :design, presence: true
  paginates_per 10
end
