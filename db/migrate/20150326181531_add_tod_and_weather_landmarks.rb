class AddTodAndWeatherLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :tod, :string
    add_column :landmarks, :weather, :string
  end
end
