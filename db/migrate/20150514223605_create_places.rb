class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :google_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end