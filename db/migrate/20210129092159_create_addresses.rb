class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode,        null: false
      t.integer :state_id,      null: false
      t.string :city,           null: false
      t.string :address_line_1, null: false
      t.string :address_line_2, null: false
      t.string :phone_number,   null: false
      t.references :order,      foreign_key: true
      t.timestamps
    end
  end
end