class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :name,                   null: false
      t.integer    :category_id,            null: false
      t.integer    :price,                  null: false
      t.text       :item_text,              null: false
      t.integer    :delivery_free_id,       null: false
      t.integer    :product_condition_id,   null: false
      t.integer    :delivery_source_id,     null: false
      t.integer    :estimated_delivery_id,  null: false
      t.references :user,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
