class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :image
      t.string :phonenumber
      t.string :location
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
