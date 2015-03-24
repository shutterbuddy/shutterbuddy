class Photo < ActiveRecord::Base
  belongs_to :landmark


  def initialize(result)
    @flickr_result = result
  end

  def url
    FlickRaw.url(@flickr_result)
  end

end
