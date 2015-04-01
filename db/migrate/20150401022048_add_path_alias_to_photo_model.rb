class AddPathAliasToPhotoModel < ActiveRecord::Migration
  def change
    add_column :photos, :path_alias, :string
  end
end
