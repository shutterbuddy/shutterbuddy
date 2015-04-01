class SearchesController < ApplicationController
  before_action :set_search, only:[:show, :destroy, :update, :share]

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
    @search = Search.find(params[:id])
    images = @search.get_images
    if images.empty?
      flash[:notice] = "No photos for that search, please try another place"
      redirect_to new_landmarks_search_path(@search)
    else
      images.each do |flickr|
        attribution, path_alias = flickr.attribution_and_path_alias
        @search.photos.build(url: flickr.url, attribution: attribution, path_alias: path_alias)
      end
    end
  end

  def create_photos
    @search = Search.find(params[:id])
    @search.update(search_params)

    redirect_to search_path(@search)

    # params[:photos].each do |p|
    #   Photo.create!(p[:photo_id])
    # array = params[:photos]
    # array.each do |url|
    #   Photo.create!(search_id: params[:id], url: url)
    # end

  end

  def show
  end

  def share
  end


  private
  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:name,
                                  landmarks_attributes: [:name, :link, :search_id, :tod, :weather],
                                  photos_attributes: [:url, :attribution, :search_id, :path_alias]
                                  )
  end

end
