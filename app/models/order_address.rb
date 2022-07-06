class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :block, :building, :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id, :item_id, :token
    validates :postcode,           format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id,    numericality: {other_than: 1, message: "can't be blank"}
    validates :city,               format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :block,              format: {with: /\A[ぁ-んァ-ヶ一-龥々ー０-９]+\z/}
    validates :phone_number,       format: {with: /\A\d{10,11}\z/}
  end
  validates :building,             format: {with: /\A[ぁ-んァ-ヶ一-龥々ー０-９]*\z/}
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
  
end