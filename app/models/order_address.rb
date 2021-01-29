class OrderAddress
  include ActiveModel::ActiveModel
  attr_accessor :token, :zipcode, :state_id, :city, :address_line_1, :address_line_2, :phone_number

  with_options presence: true do
    validates :token
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :city
    validates :address_line_1
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number" }
  end
  validates :state_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(zipcode: zipcode, state_id: state_id, city: city, address_line_1: address_line_1, address_line_2: address_line_2, phone_number: phone_number, order_id: order.id)
end