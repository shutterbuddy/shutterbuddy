class Landmark < ActiveRecord::Base
  belongs_to :search
  has_many :photos
  # accepts_nested_attributes_for :photo

  def get_results
  end


  # def conditions
  #
  #   return self.weather
  #   if weather == "rainy"
  #     return "rainy"
  #   elsif conditions == "snowy"
  #     return "snowy"
  #   else conditions == "clear"
  #     return "clear"
  #   end
  #
  # end

  # def tod
  #   if hour == "golden hour"
  #     return "golden hour"
  #   elsif hour == "night"
  #     return "night"
  #   else hour == "day"
  #     return "day"
  #   end
  # end

  def text
    "#{name}"
  end

  def tags
    "#{weather}, #{tod}"
  end

end
