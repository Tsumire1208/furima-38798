class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to        :user
  has_one           :order
  has_many_attached :images

  belongs_to        :category
  belongs_to        :condition
  belongs_to        :freight
  belongs_to        :prefecture
  belongs_to        :delivery_time

  validates         :images,             length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates         :name,             presence: true
  validates         :item_description, presence: true
  validates         :category_id,      presence: true, numericality: { other_than: 1, message: 'は『---』以外を選択してください' }
  validates         :condition_id,     presence: true, numericality: { other_than: 1, message: 'は『---』以外を選択してください' }
  validates         :freight_id,       presence: true, numericality: { other_than: 1, message: 'は『---』以外を選択してください' }
  validates         :prefecture_id,    presence: true, numericality: { other_than: 1, message: 'は『---』以外を選択してください' }
  validates         :delivery_time_id, presence: true, numericality: { other_than: 1, message: 'は『---』以外を選択してください' }
  validates         :price,            presence: true,
                                       numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
