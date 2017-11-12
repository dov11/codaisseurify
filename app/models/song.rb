class Song < ApplicationRecord
  belongs_to :artist

  after_initialize :default_values

  validates :name, presence: true, length: { maximum: 100 }
  validates :length, numericality: {less_than_or_equal_to: 36000}

  private
  def default_values
    self.length ||= 1 if self.length.nil?
  end
end
