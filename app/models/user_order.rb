class UserOrder
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :post_code, :prefecture_id, :address, :building_number, :building_name, :phone_number, :item_id, :ser_info_id, :token

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は、-を含む半角数字で入力してください', allow_blank: true }
    validates :prefecture_id
    validates :address
    validates :building_number
    validates :phone_number, format: { with: /\d/, message: 'は半角数字で入力してください', allow_blank: true },length: { maximum: 11, message: 'が長すぎます', allow_blank: true }
    validates :item_id
    validates :token
  end

  def save
    user_info = UserInfo.create(first_name: first_name, last_name: last_name, post_code: post_code, prefecture_id: prefecture_id, address: address, building_number: building_number, building_name: building_name, phone_number: phone_number)
    Order.create(item_id: item_id, user_info_id: user_info.id)
  end
end
