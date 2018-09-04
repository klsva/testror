class CompetitionsController < ApplicationController
  def index
    @albums = Album.where("competition = 'true'")
  end

  def select_photos
    #@photos = Album.find(params[:id]).photos.pluck(:file)
    @photos = Album.find(params[:id]).photos
    respond_to do |format|
      format.json { render json: @photos }
    end
  end

  def show_info
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.json { render json: @photo }
    end
  end

  def results
    @photos = Album.find(params[:id]).photos
  end



end
