class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :name,             null: false
      t.text       :item_description, null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :freight_id,       null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :delivery_time_id, null: false
      t.integer    :price,            null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end