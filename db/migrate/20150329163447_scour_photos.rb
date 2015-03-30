class ScourPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :flickr_photo_id, :string
  end
end
