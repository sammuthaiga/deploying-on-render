cdclass CreatePlumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :plumbers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :location
      t.string :specialization
      t.string :pricing
      t.float :start_rating

      t.timestamps
    end
    add_index :plumbers, :email, unique: true
  end
end
