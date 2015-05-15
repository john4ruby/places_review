class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :duration
      t.integer :rating
      t.integer :crowd_count
      t.string :comment
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
