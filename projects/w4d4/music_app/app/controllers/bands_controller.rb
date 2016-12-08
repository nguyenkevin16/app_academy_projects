class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      # flash.now error
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      # flash.now error
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    @band
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
