class CreateNoParkingZones < ActiveRecord::Migration[5.2]
  def change
    create_table :no_parking_zones do |t|
      t.string :street
      t.string :reason
      t.string :date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
