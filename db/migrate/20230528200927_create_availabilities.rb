class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.references :plumber, null: false, foreign_key: true
      t.boolean :available
      t.date :expected_available_date

      t.timestamps
    end
  end
end
