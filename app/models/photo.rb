class Photo < ActiveRecord::Base
  belongs_to :landmark
  belongs_to :search
end
