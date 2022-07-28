class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :star_rating
      t.integer :restaurant_id
      t.integer :customer_id
    end
  end
end
