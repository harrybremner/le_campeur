class AddCoordinatesToCampervans < ActiveRecord::Migration[7.0]
  def change
    add_column :campervans, :latitude, :float
    add_column :campervans, :longitude, :float
  end
end
