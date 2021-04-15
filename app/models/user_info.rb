class UserInfo < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :post_code
    validates :prefecture_id
    validates :address
    validates :building_number
    validates :phone_number
  end
end
