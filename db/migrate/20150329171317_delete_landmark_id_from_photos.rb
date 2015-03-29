class DeleteLandmarkIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :landmark_id, :integer
  end
end
