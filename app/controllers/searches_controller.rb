class SearchesController < ApplicationController
  before_action :set_search, only:[:show, :destroy, :update]

  def index
  end

  def new
    @search = Search.create!(name: params[:city])
      if @search.save
        redirect_to new_landmarks_search_path(@search)
      else
        render :new, notice: "invalid search terms, please enter a city name"
    end
  end

  def new_landmarks

    @search = Search.find(params[:id])
    @landmark_names = @search.get_landmark_names
  end

  def create_landmarks

  end

  def new_photos

  end

  def create_photos

  end

  def show
    @selected_landmarks = Photo.get_images_for_location(@selected_landmarks)
  end


  def create
    @search = Search.new(name: params[:city])

    @landmark_names = @search.get_landmark_names
    @selected_landmarks = params[:landmarks]


    # @photos = params[:photos]
  #   @results = @landmark_names.refine_selection
    # @selected_landmarks = selected_landmarks

  end

  # def create_album
  #   @album = Album.create(params[:selected_landmarks])
  #   # @album = Album.new(album_params)
  #   respond_to do |format|
  #     if @album.save
  #       format.html { redirect_to @album, notice: 'Album was successfully created.' }
  #       format.json { render :show, status: :created, location: @album }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @album.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  private
  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name,
                                  landmarks_attributes: [:name, :link, :search_id,
                                                            photo_attributes: [:title, :url, :owner]]
                                    )
  end

end
