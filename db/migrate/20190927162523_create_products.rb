class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :identity
      t.string :species
      t.string :common_name
      t.string :origin
      t.string :country
      t.integer :viable_seed_per_kg
      t.string :availability
      t.string :uses
      t.float :price

      t.timestamps
    end
  end
end
