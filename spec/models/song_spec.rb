require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to an artist" do
      song = artist.songs.build(name: "Some song")

      expect(song.artist).to eq(artist)
    end
  end

end
