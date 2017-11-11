class Artist < ApplicationRecord
  has_many :songs
  has_many :pictures
  validates :name, presence: true
end
