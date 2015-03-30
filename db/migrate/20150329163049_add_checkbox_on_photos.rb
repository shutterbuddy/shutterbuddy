class AddCheckboxOnPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :checked, :boolean
  end
end
