class Landmark < ActiveRecord::Base
  belongs_to :search
  has_many :photos
  # accepts_nested_attributes_for :photo

  def get_results
  end

  def tags
    "#{self.name}, #{self.weather}"
  end

end
