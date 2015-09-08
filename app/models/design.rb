class Design < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :user, presence: true
  validates :design_image, presence: true
  validates :design_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 50 }
  validate :validate_image_size
  mount_uploader :design_image, DesignImageUploader


def validate_image_size
  image = MiniMagick::Image.open(design_image.path)
  unless image[:width] == 1200 && image[:height] == 1200
    errors.add :image, "must be exactly 1200x1200px!"
  end
end
  paginates_per 10
end
