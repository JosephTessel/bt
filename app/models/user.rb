class User < ActiveRecord::Base
  has_many :designs, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :email, presence: true
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

mount_uploader :profile_photo, ProfilePhotoUploader

end
