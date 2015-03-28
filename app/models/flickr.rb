class Flickr

  def initialize(result)
    @flickr_result = result
  end

  def url
    FlickRaw.url(@flickr_result)
  end

  def owner
    self.as_json["flickr_result"]["owner"]
  end

  def photo_id
    self.as_json["flickr_result"]["id"]
  end


  # def attribution
  #   FlickRaw.attribution(@flickr_result)
  # end
end
