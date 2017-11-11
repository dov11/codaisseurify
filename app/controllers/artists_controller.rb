class ArtistsController < ApplicationController
  def index
    @artists=Artist.all
  end

  def show
    @artist=Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_artist_song_path(@artist), notice: "Artist created, you can now add songs"
    else
      render :new
    end
  end

  def destroy
    artist = set_artist
    artist.pictures.destroy_all
    artist.songs.destroy_all
    artist.destroy
    redirect_to root_path, notice: "Artist destroyed"
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :active_since)
  end
end
