class SearchesController < ApplicationController
  before_action :set_search, only:[:show, :destroy, :update]

  def index
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(name: params[:city])
    if @search.save
      redirect_to new_landmarks_search_path(@search)
    else
      render :new, notice: "invalid search terms, please enter a city name"
    end
  end

  def new_landmarks
    @search = Search.find(params[:id])
    @search.get_landmark_names.each do |name|
      @search.landmarks.build(name: name)
    end
  end

  def create_landmarks
    @search = Search.find(params[:id])
    @search.update(search_params)
    redirect_to new_photos_search_path(@search)
  end

  def new_photos
    # @selected_landmarks = Photo.get_images_for_location(@selected_landmarks)
    @search = Search.find(params[:id])
    @images = @search.get_images

  end

  def create_photos
    @search = Search.find(params[:id])
    # byebug
    # params[:photos].each do |p|
    #   Photo.create!(p[:photo_id])
    array = params[:photos]
    array.each do |url|
      Photo.create!(search_id: params[:id], url: url)
    end
    redirect_to search_path(@search)
  end

  def show
  end


  private
  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name,
                                  landmarks_attributes: [:name, :link, :search_id, :tod, :weather,
                                                            photo_attributes: [:title, :url, :owner, :photo_id]]
                                    )
  end

end
