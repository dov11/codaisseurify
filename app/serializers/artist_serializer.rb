class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :active_since

  has_many :songs
end
