class Design < ActiveRecord::Base
  belongs_to :user
  # has_many :reviews
  validates :user, presence: true
  validates :design_name, presence: true 
end
