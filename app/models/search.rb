class Search < ActiveRecord::Base
  has_many :landmarks
  has_many :photos

  accepts_nested_attributes_for :landmarks
  accepts_nested_attributes_for :photos

  def map_query
    if name.present?
      "tourism+in+#{name.split.join('+')}"
    else
      "Rome+Italy"
    end
  end

  def get_landmark_names
    landmark_names = []
    if name.present?
      url ="https://maps.googleapis.com/maps/api/place/textsearch/json?query=tourism+in+#{name.split.join('+')}&key=#{ENV['GOOGLE_KEY']}"

      response = HTTParty.get(url, headers: {"Referer" => "http://localhost:3000/"})

      results = response["results"]

      results.reverse.sort_by! {|a| a["rating"].to_f}

      results.each do |r|
        landmark_names << r["name"]
      end
    end
    landmark_names
  end

  def get_images
    photos = []
    landmarks_list = []
    self.landmarks.each do |l|
      landmarks_list << l.name
    end

    landmarks_list.each do |landmark|
      search_results = flickr.photos.search(tags: landmark, license: 3, privacy_filter: 1, safe_search: 1, content_type: 1, per_page: 5 )
      photos += search_results.map { |result| Flickr.new(result) }
    end
    photos
  end


end
