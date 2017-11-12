class SongsController < ApplicationController
  def show
    @artist=set_artist
    @song = set_song
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
    @song = set_song
    @artist = set_artist
  end

  def update
    if set_song.update(song_params)
      redirect_to artist_path(set_artist), notice: "Song updated"
    else
      redirect_to artist_path(set_artist), notice: "Unaccaptable parameters, please try again"
    end
  end

  def destroy
    song = set_song
    song.destroy
    redirect_to artist_path(set_artist), notice: "Song deleted"
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

end
