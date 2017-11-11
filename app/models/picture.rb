class Picture < ApplicationRecord
  belongs_to :artist
  mount_uploader :image_url, ImageUploader
end
