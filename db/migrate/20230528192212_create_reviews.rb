class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plumber, null: false, foreign_key: true
      t.integer :star_rating
      t.text :review_message
      t.boolean :endorsed
      t.boolean :recommended

      t.timestamps
    end
  end
end
