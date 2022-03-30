class AddGardenToPlants < ActiveRecord::Migration[6.1]
  def change
    add_reference :plants, :garden, null: false, foreign_key: true
  end
end
