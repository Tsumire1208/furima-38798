class Item < ApplicationRecord
  belongs_to :user

  validates :name,             null: false
  validates :item_description, null: false
  validates :category_id,      null: false
  validates :condition_id,     null: false
  validates :freight_id,       null: false
  validates :prefecture_id,    null: false
  validates :delivery_time_id, null: false
  validates :price,            null: false
  
end
