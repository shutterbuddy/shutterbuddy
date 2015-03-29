class ScourPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :photo_id, :string
    remove_column :photos, :selected_photo, :boolean
    remove_column :photos, :flickr_photo_id, :string
  end
end
