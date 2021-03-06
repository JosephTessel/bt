# encoding: utf-8
class ProfilePhotoUploader < CarrierWave::Uploader::Base
  if Rails.env.test? || Rails.env.development?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
   %w(jpg jpeg gif png)
  end

end
