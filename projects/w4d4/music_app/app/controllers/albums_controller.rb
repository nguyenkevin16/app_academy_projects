class AlbumsController < ApplicationController
  before_action :not_logged_in_redirect

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save!
      # redirect_to album_url(@album)
      redirect_to album_url(@album)
    else
      # flash.now error
      redirect_to new_album_url
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      # flash.now error
      render :edit
    end
  end

  def destroy
    album = Album.find(params[:id])
    band_id = album.band_id
    album.destroy
    redirect_to band_url(band_id)
  end

  private

  def album_params
    params.require(:album).permit(:name, :recorded_location, :band_id)
  end
end
