class Design < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :user, presence: true
  validates :design_image, presence: true
  validates :design_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 50 }
  validate :validate_minimum_image_size
  mount_uploader :design_image, DesignImageUploader
end
