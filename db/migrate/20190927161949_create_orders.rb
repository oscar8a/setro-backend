class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :user_id
      t.boolean :status
      t.date :date

      t.timestamps
    end
  end
end
