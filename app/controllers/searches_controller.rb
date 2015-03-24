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
    @landmark_names = @search.get_landmark_names
  end

  def create_landmarks
    @search = Search.find(params[:id])
    params[:landmarks].each do |l|
      Landmark.create!(search_id: params[:id],
                      name: l,
      )
    end
    redirect_to new_photos_search_path(@search)
  end

  def new_photos
    # @selected_landmarks = Photo.get_images_for_location(@selected_landmarks)
    @search = Search.find(params[:id])
    @images = @search.get_images

  end

  def create_photos
    # @search = Search.find(params[:id])
    # byebug
    # params[:photos].each do |p|
    #   Photo.create!(p[:photo_id])
    # end
    # # def self.get_images_for_location(landmark_names)
    photos = []

      @selected_landmarks.each do |landmark|
        search_results = flickr.photos.search(tags: selected_landmarks, license: 3, privacy_filter: 1, safe_search: 1, content_type: 1, per_page: 5 )

        photos += search_results.map { |result| Photo.create!(result) }
      end
      photos
  end

  def show
    # @selected_landmarks = Photo.get_images_for_location(@selected_landmarks)
  end





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
