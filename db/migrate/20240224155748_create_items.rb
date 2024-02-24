class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,          null: false, default: ""
      t.text   :detail
      t.integer :price,              null: false, default: 0
      t.integer :situation_id,              null: false, default: 0
      t.integer :delivery_day_id,              null: false, default: 0
      t.integer :load_style_id,              null: false, default: 0
      t.integer :category_id,              null: false, default: 0
      t.integer :prefecture_id,              null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
