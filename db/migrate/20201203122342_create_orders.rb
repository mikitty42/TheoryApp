class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status,default: 0
      t.string :email
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
