class AddSearchIdToPhotos < ActiveRecord::Migration
  def change
    add_column: photos:, :search_id, :integer
    add_column: photos:, :owner, :string
  end
end
