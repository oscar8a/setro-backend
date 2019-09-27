class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.float :price

      t.timestamps
    end
  end
end
