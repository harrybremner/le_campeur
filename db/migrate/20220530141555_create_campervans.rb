class CreateCampervans < ActiveRecord::Migration[7.0]
  def change
    create_table :campervans do |t|
      t.string :camper_type
      t.string :camper_make
      t.integer :total_occupancy
      t.integer :total_beds
      t.string :region
      t.boolean :has_bathroom
      t.boolean :has_shower
      t.boolean :has_kitchen
      t.boolean :has_internet
      t.boolean :has_tv
      t.float :price
      t.string :address

      t.timestamps
    end
  end
end
