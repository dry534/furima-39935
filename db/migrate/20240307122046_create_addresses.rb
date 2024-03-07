class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,      null: false, default: ""
      t.integer :prefecture_id,  null: false, default: 0
      t.string :city,      null: false, default: ""
      t.string :block
      t.string :building_name
      t.string :phone_number,  null: false, default: ""
      t.references :buying_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
