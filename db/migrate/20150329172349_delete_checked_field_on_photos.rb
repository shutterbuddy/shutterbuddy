class DeleteCheckedFieldOnPhotos < ActiveRecord::Migration
  def change
  
    remove_column :photos, :checked, :boolean
  end
end
