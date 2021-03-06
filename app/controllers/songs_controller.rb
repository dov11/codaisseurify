class SongsController < ApplicationController
  def show
    @artist=set_artist
    @song = set_song
    render json: @song if params[:format] == 'json'
    # @duration = @song.convert_to_time
  end
  def new
    @song = set_artist.songs.build
  end

  def create
    @song = set_artist.songs.build(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to artist_path(set_artist), notice: "Song not created" }
        format.json { render json: {song: @song, status: :created} }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
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
    respond_to do |format|
      #disabled: format.html { redirect_to artist_path(set_artist), notice: "Song deleted" }
      format.json { render json: {song: @song, status: :deleted}}
    end
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
