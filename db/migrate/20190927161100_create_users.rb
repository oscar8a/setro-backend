class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
