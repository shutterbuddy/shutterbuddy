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

  def get_username
    # FlickRaw.owner(@flickr_result)
    owner = flickr.photos.getInfo(@flickr_result)
    # photos: params[:username]
  end


  # def attribution
  #   FlickRaw.attribution(@flickr_result)
  # end
end
