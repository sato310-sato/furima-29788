class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :name,                null: false
      t.integer    :category,            null: false
      t.integer    :price,               null: false
      t.text       :item_text,           null: false
      t.integer    :delivery_free,       null: false
      t.integer    :product_condition,   null: false
      t.integer    :delivery_source,     null: false
      t.integer    :estimated_delivery,  null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
