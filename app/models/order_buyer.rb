class OrderBuyer

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}
    validates :municipalities
    validates :address
    validates :phone, format: { with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone: phone, order_id: order.id)
  end
end