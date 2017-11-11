# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
include Cloudinary::CarrierWave
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  version :thumbnail do
      eager
      resize_to_fit(150, 150)
      cloudinary_transformation :quality => 80
    end

end
