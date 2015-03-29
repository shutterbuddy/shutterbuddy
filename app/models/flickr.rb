class Flickr

  def initialize(result)
    @flickr_result = result
  end

  def url
    FlickRaw.url(@flickr_result)
  end

  def attribution
    info_results = flickr.photos.getInfo(photo_id: self.photo_id)
    info_results["owner"]["username"]
  end

  def photo_id
    self.as_json["flickr_result"]["id"]
  end

end
