class TracksController < ApplicationController
  before_action :not_logged_in_redirect

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save!
      redirect_to track_url(@track)
    else
      redirect_to new_track_url
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album)
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
