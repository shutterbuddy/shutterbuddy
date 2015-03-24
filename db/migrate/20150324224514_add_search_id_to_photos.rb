class AddSearchIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :search_id, :integer
  end
end
