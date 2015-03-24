class Photo < ActiveRecord::Base
  belongs_to :landmark

  
  def initialize(result)
    @flickr_result = result
  end

  def url
    FlickRaw.url(@flickr_result)
  end

  # def self.get_random_image
  #
  #   # list   = flickr.photos.getRecent
  #   search_results = flickr.photos.search(tags: landmark_names, license: 3, privacy_filter: 1, safe_search: 1, content_type: 1, per_page: 5 )
  #
  #   id     = list[0].id
  #   secret = list[0].secret
  #
  #   info = flickr.photos.getInfo :photo_id => id, :secret => secret
  #
  #   Photo.create(url: info.urls[0])
  # end
  #
  def self.get_images_for_location(landmark_names)
  #   photos = []
  #
  #   landmark_names.each do |landmark|
  #     search_results = flickr.photos.search(tags: landmark_names, license: 3, privacy_filter: 1, safe_search: 1, content_type: 1, per_page: 5 )
  #
  #     photos += search_results.map { |result| Photo.new(result) }
  #   end
  #   photos
  end

end
