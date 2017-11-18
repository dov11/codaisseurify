class SongSerializer < ActiveModel::Serializer
  attributes :id, :name,  :release_date, :length

  belongs_to :artist
end
