class Song < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true, length: { maximum: 100 }
  validates :length, numericality: {less_than_or_equal_to: 36000}
end
