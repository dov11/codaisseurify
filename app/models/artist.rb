class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :name, presence: true
end
