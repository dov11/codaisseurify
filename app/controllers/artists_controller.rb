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
      pictures_params.each do |picture|
        @artist.pictures.create(image_url: picture)
      end
      redirect_to new_artist_song_path(@artist), notice: "Artist created, you can now add songs"
    else
      render :new
    end
  end

  def destroy
    artist = set_artist
    if !artist.core_artist?
      artist.destroy
      redirect_to root_path, notice: "Artist destroyed"
    else
      flash[:alert] = "Core artists cannot be destroyed, you can try to destroy other artists"
      render :show
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :active_since)
  end

  def pictures_params
    params[:pictures].present? ? params.require(:pictures) : []
  end

end
