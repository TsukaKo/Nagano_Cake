class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :addresses
      t.string :name
      t.integer :payment_method
      t.integer :postage
      t.integer :order_active
      t.integer :billing_amount
      t.datetime :created_at
      t.datetime :updated_at
      t.string :postal_code
      t.timestamps
    end
  end
end
