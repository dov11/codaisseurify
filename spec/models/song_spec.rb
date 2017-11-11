require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to an artist" do
      song = artist.songs.build(name: "Some song")

      expect(song.artist).to eq(artist)
    end
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it "is invalid with a name longer than 100 characters" do
      song = Song.new(name: Faker::Lorem.characters(101))
      song.valid?
      expect(song.errors).to have_key(:name)
    end
    it "is invalid if the song is longer than 10 hours" do
      song = Song.new(length: 36001)
      song.valid?
      expect(song.errors).to have_key(:length)
    end
  end
end
