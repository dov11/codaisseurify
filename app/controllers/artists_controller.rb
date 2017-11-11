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
end
