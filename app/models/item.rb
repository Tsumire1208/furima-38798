class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  has_one          :order
  has_one_attached :image

  belongs_to       :category
  belongs_to       :condition
  belongs_to       :freight
  belongs_to       :prefecture
  belongs_to       :delivery_time

  validates        :image,            presence: true
  validates        :name,             presence: true
  validates        :item_description, presence: true
  validates        :category_id,      presence: true, numericality: { other_than: 1 }
  validates        :condition_id,     presence: true, numericality: { other_than: 1 }
  validates        :freight_id,       presence: true, numericality: { other_than: 1 }
  validates        :prefecture_id,    presence: true, numericality: { other_than: 1 }
  validates        :delivery_time_id, presence: true, numericality: { other_than: 1 }
  validates        :price,            presence: true,
                                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
