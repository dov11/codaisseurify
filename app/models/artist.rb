class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def core_artist?
    ["Alphaville", "Night Ranger", "Immortal", "Timecop1983", "The Cure", "Artist3"]
    .include?(name)
  end

  def self.sort_by_name_ascending
    order :name
  end

  def self.sort_by_name_des
    self.order('name desc')
  end

  def self.sort_by_created_asc
    self.order('created_at asc')
  end

  def self.sort_by_created_des
    self.order('created_at desc')
  end

  def self.sort_by(option)
    case option
    when "Order by name Z↓A"
      self.sort_by_name_des
    when "Order by time of creation↑"
      self.sort_by_created_asc
    when "Order by time of creation↓"
      self.sort_by_created_des
    else
      self.sort_by_name_ascending
    end
  end

end
