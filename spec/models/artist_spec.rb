require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it "is invalid without name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it { should validate_uniqueness_of(:name) }
  end

  describe "association with song" do
    let(:artist) { create :artist }
    let!(:song) { create :song, artist: artist }

    it "has many songs" do
      song1 = artist.songs.new(name: "Wonderwall")
      song2 = artist.songs.new(name: "Extraordinary")

      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Song, :count).by(-1)
    end
  end

  describe "association with picture" do
    let(:artist) { create :artist }
    let!(:picture) { create :picture, artist: artist }

    it "has many pictures" do
      picture1 = artist.pictures.new(image_url: "Someurl")
      picture2 = artist.pictures.new(image_url: "differenturl")

      expect(artist.pictures).to include(picture1)
      expect(artist.pictures).to include(picture2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Picture, :count).by(-1)
    end
  end

  describe "core_artist?" do
    let(:core_artist) { create :artist, name: "Alphaville"}
    let(:non_core_artist) { create :artist, name: "New name"}
    it "returns true if the artist is core artist" do
      expect(core_artist.core_artist?).to eq(true)
      expect(non_core_artist.core_artist?).to eq(false)
    end
  end

  describe "sorting" do
    let!(:artist1) { create :artist, name: "Ab" }
    let!(:artist2) { create :artist, name: "Aa" }
    let!(:artist3) { create :artist, name: "z" }
    it "returns sortings by name and creation" do
      expect(Artist.sort_by_name_des).to eq([artist3, artist1, artist2])
      expect(Artist.sort_by_name_ascending).to eq([artist2, artist1, artist3])
      expect(Artist.sort_by_created_des).to eq([artist3, artist2, artist1])
      expect(Artist.sort_by_created_asc).to eq([artist1, artist2, artist3])
    end
  end

end
