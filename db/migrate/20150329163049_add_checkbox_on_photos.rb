class AddCheckboxOnPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :checked, :boolean
    remove_column :photos, :title, :string
  end
end
