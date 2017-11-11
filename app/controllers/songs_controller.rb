class SongsController < ApplicationController
  def show
    @song=Song.find(params[:id])
    @artist_name=name_of_song_artist
    # @duration = @song.convert_to_time
  end
  # def convert_to_time
  #   minutes = (@song.length / 60) % 60
  #   seconds = @song.length % 60
  #   format("%02d:%02d", minutes, seconds)
  # end
  private
  def name_of_song_artist
    @song.artist.name
  end
end
