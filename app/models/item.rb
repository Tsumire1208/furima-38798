class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :freight
  belongs_to :prefecture
  belongs_to :delivery_time


  validates :name,             presence: true
  validates :item_description, presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :freight_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_time_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,            presence: true
  validates :image,            presence: true
  validates :user_id,          presence: true

end
