class Landmark < ActiveRecord::Base
  belongs_to :search

  def get_results
  end


  def text
    "#{name}"
  end

  def tags
    "#{weather}, #{tod}"
  end

end
