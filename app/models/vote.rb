class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :design
  validates :vote, inclusion: { in: -1..1 }
end
