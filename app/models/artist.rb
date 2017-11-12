class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def core_artist?
    ["Alphaville", "Night Ranger", "Immortal", "Timecop1983", "The Cure", "Artist3"]
    .include?(name)
  end

end
