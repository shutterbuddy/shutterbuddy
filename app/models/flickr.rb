class Flickr

  def initialize(result)
    @flickr_result = result
  end

  def url
    FlickRaw.url(@flickr_result)
  end

  def photo_id
    @flickr_result["id"]
  end

  def get_owner
    FlickRaw.owner(@flickr_result)
  end


  # def attribution
  #   FlickRaw.attribution(@flickr_result)
  # end
end
