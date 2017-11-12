require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to an artist" do
      picture = artist.pictures.build(image_url: "Some picture")

      expect(picture.artist).to eq(artist)
    end
  end
end
