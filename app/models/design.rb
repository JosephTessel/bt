class Design < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :reviews
  has_many :ratings
  validates :user, presence: true
  validates :design_name, presence: true, length: { maximum: 50 }
  mount_uploader :design_image, DesignImageUploader
end
