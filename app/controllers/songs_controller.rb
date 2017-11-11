class SongsController < ApplicationController
  def show
    @artist_name=name_of_song_artist
    # @duration = @song.convert_to_time
  end
  def new
    @song = set_artist.songs.build
  end

  def create
    @song = set_artist.songs.build(song_params)

    if @song.save
      redirect_to artist_path(set_artist), notice: "Song created"
    else
      render :new
    end
  end

  def edit

  end
  # def convert_to_time
  #   minutes = (@song.length / 60) % 60
  #   seconds = @song.length % 60
  #   format("%02d:%02d", minutes, seconds)
  # end
  private
  def set_song
    @song=Song.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params
    .require(:song)
    .permit(:name, :length, :release_date)
  end
  def name_of_song_artist
    set_song.artist.name
  end
end
