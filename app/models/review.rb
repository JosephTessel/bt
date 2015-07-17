class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :design
  has_many :votes

  validates :body, presence: true
  validates :user, presence: true
  validates :design, presence: true
  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  paginates_per 10
end
