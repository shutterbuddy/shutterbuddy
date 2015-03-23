class AlbumsController < ApplicationController
  def index
    @photos = params[:photos]
    @album = Album.create(params[:selected_landmarks])
  end

  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end


  private def album_params
    params.require(:album).permit(photo_attributes: [:title, :url, :owner])
  end


end
