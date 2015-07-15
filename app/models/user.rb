class User < ActiveRecord::Base
  has_many :designs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

mount_uploader :profile_photo, ProfilePhotoUploader

end
