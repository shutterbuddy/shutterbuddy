class Flickr

  def initialize(result)
    @flickr_result = result
  end

  def url
    FlickRaw.url(@flickr_result)
  end

  def attribution_and_path_alias
    info_results = flickr.photos.getInfo(photo_id: self.photo_id)
    attribution = info_results["owner"]["username"]
    path_alias = info_results["owner"]["path_alias"]
    if path_alias == nil
      path_alias = info_results["owner"]["nsid"]
    end
    return attribution, path_alias
  end

  def photo_id
    self.as_json["flickr_result"]["id"]
  end

end
