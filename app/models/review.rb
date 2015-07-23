class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :design

  validates :body, presence: true, length: { maximum: 250 }
  validates :user, presence: true
  validates :design, presence: true
  paginates_per 10
end
